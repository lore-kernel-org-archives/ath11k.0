Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A05FCCFA04
	for <ath11k@archiver.kernel.org>; Wed,  5 Nov 2025 02:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6fE25BWx2cqViq02OoeLjnc0qT5FrD3WFYx473CdTs=; b=4AcMmLhIMyzrn8vFzJBb2XuXjb
	Iv6qsGyJM0tvTvMmeatvVLvQBGqalTXKRh0537NroJAHFx9WCo6r7YRv/J2Yih6kKxzKpAgXspyrM
	1bySOzFTSCC2O+enKB7SQ0a7embWgSXMdS/x/bPxL/A3lTqXgb90JQjYF7sLrWtpXhgAsYsiv3uBI
	W1jYgFCA6seb+QQJmkxUBBEms1FOsq1837x2EniF5TAKtuIBe7/Ww2/x0azs7ae6fVwKVXeqagaj0
	e2ot+ztn4m9voGof2oULg3rbfNGQBbehISh+i91yvHeKe8VFHZNsycc1NUES+2gIj5utYTVmz5IEV
	yDWLQEyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGTas-0000000CvPN-0Sow;
	Wed, 05 Nov 2025 02:49:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGTap-0000000CvP3-2Z6g
	for ath11k@lists.infradead.org;
	Wed, 05 Nov 2025 02:49:52 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4Kfu263042838
	for <ath11k@lists.infradead.org>; Wed, 5 Nov 2025 02:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z6fE25BWx2cqViq02OoeLjnc0qT5FrD3WFYx473CdTs=; b=HoSWexWGizap5AgJ
	FqZzHP/6i/annH3353tKGyBFj4mEZrJd9lUr/AXkC7ejnKlYtxBBWno+96D862ES
	onQVPEOM1Dp9QQqnzCFiKH4IA53nR4BUOyf6iqfF+hynL5IkmOIyXM1wEhgAqW54
	JNHiy5HW5+OPFudGFs9G2xOe1VYy9Jqf5ogvlesvqIBOFGKmWyaml9BVdigGw97g
	E8DmIHGCXRTlhETVaicc7fDCCbrjvLjRsfHhCDU6uIAQn8K74atfo/1lGCuLQyzJ
	g0+5rk6HG+VvJAjr6xnw/tHCj5kgPcBwVerFmKaINmBnT2mL4p5mfxNX5Flx+Fy3
	k8gzvw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a78equwxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 05 Nov 2025 02:49:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-294ecd3fdd4so76523105ad.3
        for <ath11k@lists.infradead.org>; Tue, 04 Nov 2025 18:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762310990; x=1762915790; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z6fE25BWx2cqViq02OoeLjnc0qT5FrD3WFYx473CdTs=;
        b=jDSLEp7E/K/DUbo8eKfpHW4OvIHPVW4SUzTGk/O7W+/9TxoMzOJ2ZhkUDUjeLDoBjk
         t0hy5nvNm/PH0obp3wGiZ34ULss9iemhKmhl9uKkfSCy9M4kEKqrJUyduK1R0g0QOMGK
         3SimlWHekoGaLg2RNdZSM0/QgvSuzuxTeeky+10ZpbKXt3WWFDdrCy91JSLRIBZvcOUl
         ADEDibGwTR5g8iGg2Mj0zC3DylDDKGUoL8VQyYpETi709ffeP7GrKWPzuDuhP4b08erz
         zk5aJJKoS5OYfwjthusNrGj9pEeyOwivHIMcK/KA+0bwcdVOVAZ+CNya3ChdFtoH5qfF
         8OGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762310990; x=1762915790;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z6fE25BWx2cqViq02OoeLjnc0qT5FrD3WFYx473CdTs=;
        b=pEbT/MlEMvnTuWRoM8y9TA7RWehG5ez3cKpTuUij8YPcFf68AkmPXfJbgzbNBLOHjj
         fCUEMD8OC6inixcFBjlF8FTYzwvMWS7ky6/lohOctnh+yNsaxY2YIgOIZtWYJgWHAxPp
         qd2+9CnaIB/2TNAsZvmHltqM4WC+bWHssEKpzb0qypzxtVDmwGGZ7KoRab/TiqadoQLr
         7OIxBWgMYkTFFtEfTVJcsj/3LWjikFcaqSEp6zwX5rFh/6S/wMnGvcc9/ZezHMzqJiZQ
         D7cG0+oxvAihNdVoB36jUoqJUk4F8IUrNa1GDstQNpIknK3geqUNq76u8V08fsR6TkQu
         hDlg==
X-Forwarded-Encrypted: i=1; AJvYcCXfriXUaTrBm1clrWZx1U+TTOn6SpJtaTBSo30eXwkQ2OymA+Ujmcy4tiBgfDBaKS4dfOKJDUU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxIT99CziBF8aXZ3pGHXVmry+UXNjjWWDQUK8+p4ceO2avJ++/v
	J7PEfbHudF/4d2PqO3bDG+Hnx0vdLtuPkbYbUiCnvrWxULE8R/tefMiT36pmM0SCHdB6sRLHHnd
	EPYNoF14Lzm1OaYJVFmdohGWDmiiTj/5B022OY4jXoHq2FpGBpjXmxKSuNSRm1oEI
X-Gm-Gg: ASbGncthsUvPRETUzX2Yg5IvWw185dmWxW8BDX1MpEu4mooAhVX1MobBNXvN44Jm6n3
	omqRR/dV3YJ+q1eHlixNQynNFy2Gy+/M68dK5EeVVVftGE8NZC7BS8QlcHMVd5OH3mYChIVnvyc
	19bGy+IpqFow8nGXdqyam4zG3kOHloxJkfG8yTolOFbRbl3YbzpBJpSkomY95okRyAxpTViYC6m
	WZcuObneuqCVlaoPWycowmbRC08LD/fnovZ077Q+UuOgD9dbYlHiqFrz8wEEQtbEh0Etn8hM5v/
	T+URCZbBHnk27OgxTOQkxThWm2KOPv80XjPkix5+C9nOwTpnib72x9UOFhvSerCyi93lKnafc+V
	2piA9xWB5fPNC3wpFmoJvUvcFRjcOmmFV2N0Dtk8EXUUqaerx6AJ46XJvDIOKyTsKnM0aDYQ=
X-Received: by 2002:a17:903:4b4c:b0:295:275d:21d8 with SMTP id d9443c01a7336-2962abeccd8mr23192675ad.0.1762310989538;
        Tue, 04 Nov 2025 18:49:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGasOAVoajsPy00I58jgS6ERqSmLZ5TtcB7lxyBLTzzfW7p5HgyQ6OUNo/j9HPzCCXDdgYuVA==
X-Received: by 2002:a17:903:4b4c:b0:295:275d:21d8 with SMTP id d9443c01a7336-2962abeccd8mr23192405ad.0.1762310988979;
        Tue, 04 Nov 2025 18:49:48 -0800 (PST)
Received: from [10.133.33.42] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601998da3sm42602315ad.27.2025.11.04.18.49.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 18:49:48 -0800 (PST)
Message-ID: <52b34262-ed22-43a1-b6dd-cea37c33d627@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 10:49:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 6/6] wifi: ath11k: Register handler for CFR
 capture event
To: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>, jjohnson@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
References: <20251104162633.3007874-1-yu.zhang@oss.qualcomm.com>
 <20251104162633.3007874-7-yu.zhang@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251104162633.3007874-7-yu.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDAxNiBTYWx0ZWRfX/ZWnAqgOOzaK
 8OSrC5HZCWWiCuKMSG5gi0AaUshAv7ozuEFYPX5JA+P7tuCi4jQUnKEXWVNffXtt8J3QcTw3YAL
 hw+YH+5zXWFeJvAz35FD8EJn8t4VfG9oahp8VCy2V+D3zT62GAL6TzOT/vu2hv8M97YBPw56Gq6
 gNhMpzpupSdFay181Uqvb+tArM1P3RiJAhP7IjTgrMGxl5IiEOqb1VRr74078RHSbrU7sTIsOcf
 5fXbQc5+8BR4u48MFC0i1oPeITxB9zTWH1N1ui3GsHiL2Aq5n0e0dlI3BPe423NISH4mnTFHAsb
 tIn4RgDPRnQVEeSDdPHATH1VuR7sYb1VoFfMevl4UkTI+FBzmpcCfQtJi7fb3NBd9gMfsn5XmvQ
 1ipFpFJcyYuf07KSfgVqZ8Sdt1QW6Q==
X-Authority-Analysis: v=2.4 cv=fofRpV4f c=1 sm=1 tr=0 ts=690abb4e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=xBSK4iqqMxX8BZ_fnuAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: XOJ7LJTqiSa3Jm9wxyTzygqU9xTgbrkp
X-Proofpoint-GUID: XOJ7LJTqiSa3Jm9wxyTzygqU9xTgbrkp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_184951_798066_DC3772D3 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org



On 11/5/2025 12:26 AM, Yu Zhang(Yuriy) wrote:

> +static void ath11k_cfr_fill_hdr_info(struct ath11k *ar,
> +				     struct ath11k_csi_cfr_header *header,
> +				     struct ath11k_cfr_peer_tx_param *params)
> +{
> +	header->cfr_metadata_version = ATH11K_CFR_META_VERSION_4;
> +	header->cfr_data_version = ATH11K_CFR_DATA_VERSION_1;
> +	header->cfr_metadata_len = sizeof(struct cfr_metadata);
> +	header->chip_type = ar->ab->hw_rev;
> +	header->meta_data.status = FIELD_GET(WMI_CFR_PEER_CAPTURE_STATUS,
> +					     params->status);
> +	header->meta_data.capture_bw = params->bandwidth;
> +	header->meta_data.phy_mode = params->phy_mode;
> +	header->meta_data.prim20_chan = params->primary_20mhz_chan;
> +	header->meta_data.center_freq1 = params->band_center_freq1;
> +	header->meta_data.center_freq2 = params->band_center_freq2;
> +
> +	/* CFR capture is triggered by the ACK of a QoS Null frame:
> +	 * - 20 MHz: Legacy ACK
> +	 * - 40/80/160 MHz: DUP Legacy ACK
> +	 */

same comment as in path 5/6

> +	header->meta_data.capture_mode = params->bandwidth ?
> +		ATH11K_CFR_CAPTURE_DUP_LEGACY_ACK : ATH11K_CFR_CAPTURE_LEGACY_ACK;
> +	header->meta_data.capture_type = params->capture_method;
> +	header->meta_data.num_rx_chain = ar->num_rx_chains;
> +	header->meta_data.sts_count = params->spatial_streams;
> +	header->meta_data.timestamp = params->timestamp_us;
> +	ether_addr_copy(header->meta_data.peer_addr, params->peer_mac_addr);
> +	memcpy(header->meta_data.chain_rssi, params->chain_rssi,
> +	       sizeof(params->chain_rssi));
> +	memcpy(header->meta_data.chain_phase, params->chain_phase,
> +	       sizeof(params->chain_phase));
> +	memcpy(header->meta_data.agc_gain, params->agc_gain,
> +	       sizeof(params->agc_gain));
> +}
> +

