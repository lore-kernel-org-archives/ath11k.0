Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C55C02182
	for <ath11k@archiver.kernel.org>; Thu, 23 Jan 2025 09:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8a4tOQ3adXhs+ywDF4eT+OTWG23DfBFoG6sF5Oz3mNk=; b=3I1TdnZDb4f6/ezTQRzscdY0mr
	h0tTcHuv7BHJb6GmM4RET+J7ubmB3dOF7NQqR7cKdTLXWUya28m8KS8gp9kailB+FAQAe1exEkgpN
	bsQTSNJYfwxak535p4SbICk8SPltUUyns5Hv2Rn9/aVIAE5WVJu52hZTd8vF/+rA1y2AzpB7XFQtK
	if7Hf+xVcNSjE14ne2rN2vPH/8xdogXt1X+7tuaNTPpGUkMf0tuRSnTz3Rmd56jljWeXaGc6iUrD5
	H17JTO1+CbwE15Fa3UoSNaZ17bXQhj8l1ol44t8zTE99JclkZlTia1p3U5/ALxHkvUpwUPdiZklVO
	YU0TIeeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tatGo-0000000C4Ys-47mO;
	Thu, 23 Jan 2025 09:13:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tatGm-0000000C4YF-0GZH
	for ath11k@lists.infradead.org;
	Thu, 23 Jan 2025 09:13:01 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N6ViPq008795
	for <ath11k@lists.infradead.org>; Thu, 23 Jan 2025 09:12:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8a4tOQ3adXhs+ywDF4eT+OTWG23DfBFoG6sF5Oz3mNk=; b=H4yF4hHGS5XGAaHa
	eXbaqTmu1UoifyfrZMDHgcHun72I0pMM7DTY8fIcFasuzOyP/ZPOjZyr75SxhZLE
	QlwDcf0/UJwoIGVIIn2SfY6PWp43qygvj5daTG184OKWgpEYO0VfEArDL6YkTlh5
	CgS9dx9sVc3fs0JzGl5KS8K3mNDZ2tBPOa6mgyzx6BXT8oYd92ss63KSHexpqrAS
	xfWdii5hFPoEVAB51Jj2LxVeFmg8T6B/eGKLkIHN1QfrGxyluqEMmU/gC1K2Ujxw
	kuUBUA0vcbWQ00G3eJ48mZHl2D+UrDNU4U8SCNRFsuHLujmK+g38pxZZWXhZz5gW
	rmBavQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bgk1gbhh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 23 Jan 2025 09:12:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2163a2a1ec2so24055465ad.1
        for <ath11k@lists.infradead.org>; Thu, 23 Jan 2025 01:12:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737623578; x=1738228378;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8a4tOQ3adXhs+ywDF4eT+OTWG23DfBFoG6sF5Oz3mNk=;
        b=RZZNCnlVrkyFiSbvfywnIYyn3CJ1eqizzGTxIi+u5reeCoDjK9WarAmMlQDup4I1vh
         E/mDKy2B0OrMc8uvtZB6uxotjLu5QiLLyt2JM0xsR38Vb2gii9h09KiGDF/UhTv1Ck35
         1jUGr7UUC+1JeCEv85wTOBj4KUSSp7sfSriHBQ0pWLnlYuctlCLMK2drTNYWRWGiuMoE
         LgGF9D3x4I7pq9bCnZjxVFraamtTCV6nKcbDDwvwblHOSxnT9L+WzyOOKo/Ob0aMC6RN
         yeiC3h/N7S6B0IBR4Ts5POKc1HqRGWxH6y4oDhH/OjTiOqUX9qm6PTSEO7ipiuLde1Sr
         rihA==
X-Gm-Message-State: AOJu0YwNlss62VSDz0q43cZr83RdmGia7w3YpdaxwvZ9ZbQWOb/sk/E0
	hSrJwQJTvtVKedBlibY8mi4E9LEw6FADlpedtd++HLWu2KVqdXWA+Yxj3zYzhW7u0iirx1HTSrO
	N1HB0oQatNb88Pth7rye58+8y6JLmIZrx6MdyvMfR6QDXL131kEZXAosc/lJOwpKIrTON
X-Gm-Gg: ASbGncvLRxcAS0abqplsynVzIMsEi2pSbGTIyiH44kYLiLFjdGne4zkmzKF9AOqPfYy
	xj5JZsT8nhpLgJu/wgEjRbkBWqpw2SmbB+LPIw8zdbbxzIr8E7Tydd0wN+7Sb8eUiKX4ekbGzse
	YdjJOey6BsxYYh8VfkOQTgMfgQdzwCZgoLOlVoZ0Tc/uwrFkpPOKXPDIiTnbXpMavM9UcOyfJ+G
	WSQShVHHju4zXi9J2H7h0Lm6rmBFrvEFxAXxGPNnieIAlY8rVT3enGHA871X186iw6ldOu20K96
	DVurFOtmutHFQskcXwRubPATnfXP
X-Received: by 2002:a05:6a20:6a07:b0:1e1:aef4:9cd0 with SMTP id adf61e73a8af0-1eb2144d77emr42096864637.3.1737623578442;
        Thu, 23 Jan 2025 01:12:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEE2hs/awa9LugQFA7OEJciPPr5uR5wwYgai2qpVEyLiso45KDH5OanzCXu5yBVvj7dW7Jj2Q==
X-Received: by 2002:a05:6a20:6a07:b0:1e1:aef4:9cd0 with SMTP id adf61e73a8af0-1eb2144d77emr42096837637.3.1737623578055;
        Thu, 23 Jan 2025 01:12:58 -0800 (PST)
Received: from [10.152.202.18] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ab13c2769b6sm6198546a12.31.2025.01.23.01.12.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 01:12:57 -0800 (PST)
Message-ID: <305ea8dc-7754-4ad1-8b34-151efbe38bda@oss.qualcomm.com>
Date: Thu, 23 Jan 2025 14:42:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: fix memory leak in ath11k_xxx_remove()
To: Miaoqing Pan <quic_miaoqing@quicinc.com>, kvalo@kernel.org,
        quic_jjohnson@quicinc.com
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
References: <20250123084948.1124357-1-quic_miaoqing@quicinc.com>
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250123084948.1124357-1-quic_miaoqing@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vCT7XhOcqucBszBhfbyXGWXbmEcidwyN
X-Proofpoint-ORIG-GUID: vCT7XhOcqucBszBhfbyXGWXbmEcidwyN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=746
 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1011 suspectscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501230069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_011300_107740_34C6A232 
X-CRM114-Status: UNSURE (   9.65  )
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

On 1/23/25 14:19, Miaoqing Pan wrote:
> The firmware memory was allocated in ath11k_pci_probe() or
> ath11k_ahb_probe(), but not freed in ath11k_xxx_remove() in case
> ATH11K_FLAG_QMI_FAIL bit is set. So call ath11k_fw_destroy() to
> free the memory.
> 
> Found while fixing the same problem in ath12k:
> https://lore.kernel.org/linux-wireless/20240314012746.2729101-1- 
> quic_miaoqing@quicinc.com
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04546-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
> 
> Signed-off-by: Miaoqing Pan<quic_miaoqing@quicinc.com>
> ---

Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

-- 
Aditya

