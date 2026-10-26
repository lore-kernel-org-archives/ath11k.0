Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6071A606A31D
	for <ath11k@archiver.kernel.org>; Mon, 26 Oct 2026 21:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XowUHhl1;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SWj1g++T;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HGY6cejW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tAd8MORnWjoXl94lwOMxgtVTViC1oD0+1RnyhP9e8qA=; b=XowUHhl1RhZ/IG
	jwAcGKZt+aPdhYVbjTUFDs5WnrRChC1iBth5l42qtCWDA7ZwCu0DozpQ2uh0KzouIPROkmjRhEv21
	SSrxpczUIFAB6ug1PMQQ7Mk94w7s4dIYP3juBJDZLYrluzQsv0EjFgu4XjRL/UoRVs5kyHoomZqps
	aUzBd2GiXlRyw1iJrAoSNgl6WN2Te1EYUmzesdxI5fShp7DLhl2GKd/zjFjjuFWFs0kyPgBjQKnl6
	TERJLQTft7+QdWtc/diYwbb9ROnsHUPgjV8iic7T0LxBK/GLr6SLnR//zw4aZMhq0zBW+dkjOCbNk
	WhVe9gAbConZmeEKsUXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLSLD-00000003IKB-1ZF3;
	Mon, 26 Oct 2026 21:34:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLSLB-00000003IJM-1fCU
	for ath11k@lists.infradead.org;
	Mon, 26 Oct 2026 21:34:50 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QKdUAs1210112
	for <ath11k@lists.infradead.org>; Mon, 26 Oct 2026 21:34:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tAd8MORnWjoXl94lwOMxgtVTViC1oD0+1RnyhP9e8qA=; b=SWj1g++TF+yDUQr8
	ywP/9IqD0m7ocatSpMQy8Q8jDT3oOj4l1AKnxfYt7NwDHVSn7oZo922VNeVKwesH
	SCmUvdRkVSjj5lrCE1gqiQ2SkzGRynJOJpV9CID3rXqh8xs6btFZmteeIYKeopa7
	9klJ900DpTVcKDxhNly9YlPjwrvCMjExoMwOJjr2q90Bj3DEP47t1k27rzS0aYLR
	BGUzBjh7atVnRzw6c04Budrs2hCTw7GbfskyWYrhrl3pkIfpn4ddnwlfrPfMq9qG
	vsa36kdcj5yhOhBRDY6Z5T2l3WXxX3ylySjHtiZvmAH5vSk/T4qCGEKeFnDC/wER
	7hBolQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3d84y3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 26 Oct 2026 21:34:47 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35cbea41088so5542350eec.1
        for <ath11k@lists.infradead.org>; Mon, 26 Oct 2026 14:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793050487; x=1793655287; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tAd8MORnWjoXl94lwOMxgtVTViC1oD0+1RnyhP9e8qA=;
        b=HGY6cejWHNvMfwpVi+/ScoiQJ4IsefPLCmq35HDzy/Glqq+88jgD6ReF2sRb0q2eP5
         KV1uTW7CdX4sELQ/PBA/hLFLG7EULZpSeDEyE99GuqafxrCmWdiBBBy4FGGRk0gZ7I6J
         AgBsIKqxaGXkerOU6CyMFTVyuuYowgJvQXl3SwbBoan5Qn1cSoJyQbOnumyW64eOtnH6
         bJhBqQmYSwrxIRan8WNlBFN5EG/3mVvAhc7F3qRdU3nnSiMu/XzfmqDq7rD7k7yFF7iV
         KR56T3O/DSuotpT5uYYZaD4eOmRPbyH3YFL9P5wQa3aZQuC1uHoHhkdk2oSQprw4OCfB
         YAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793050487; x=1793655287;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAd8MORnWjoXl94lwOMxgtVTViC1oD0+1RnyhP9e8qA=;
        b=JiAldD64VdWqpelB+BkHsPoKa24bJ6OwVqB7zRvOtmnZDXzV6iB34v2cM8GaLsI/k2
         upLQeg1Fywcpy0MMFkFg9bbcs10fGLrxpCg0vde0A9bjF4HYE9kRUT71lbuneBupYuS9
         14PU7099LTezVHk/4THN2EycG9y6BuvMwiJACpN9M4aEO+SV8qyet2v7YFAirOy/laJk
         pGOe12FX5bIJZf96yIFs4Z3MBM/lQodhwk/au2wG6IqaOCIjBJYfrlZ3sqiWK17Sb1rK
         zVOQ/4MxuGJij8rrGA4Pthc3zWrLRE+3PzwVnlN89I9NscDxCPg/O5y/SnO7fo49qpqh
         rOyg==
X-Forwarded-Encrypted: i=1; AKwUvByqxTYgJ1qUX6cGdeXdYSYaKY1ctfJXJpskmSPauOIqqWGSdUC5I6mByrxL9fjGNwiLcl5UE34=@lists.infradead.org
X-Gm-Message-State: AFq9FYIrh5mhRw3tKPrmxXIyqV6Zd/8DYIQYcEzHUd+yQv7JGIZgUgdc
	6ltKgyTy9wVNgwgpQpP2tj5tF7JEvP+rCFBiy1KN890rzJp8+gD7PJHdiK5qHV2TSEj8L8xiu7u
	H+QBv49asSNJHiNzH5n2nasjIbdbD9Kf135Yt+xrcKqizFlDgJrEd5rDgUsPSYo52
X-Gm-Gg: AYBFou2ZmEmvfgvsdk7pY/Z5Epuo959LEvOxQCDv69EeAvMX+m9WmsiKGkqWGfghUfy
	sQ6+VmvY8JJ+oEMGvGg4S1GSEllX2vLtYc2Gr6bu8J+ny9JAeK6WTuw7UuycocDMkXMivOU5hh4
	uZTiV10ZzEDe18QaLu87CkBOWb8kCxjvWshoKQpB9D9Yf/OGnfzz1HhjrPzzPdVBYuKb3Klp8OZ
	PICtIWEScNjvMW6xLCG7pqs9GZMAlIFRptqkkIxSER/M7JbaKJna60vR7sR8qCsmEABFB4XMvzl
	j94WobVW04uulS1ojtqY2M2HKtGy6qicdMObLjgtCpSCo4aT/qhVBkSLTmUbftCNcjhfdCySkxX
	Nx6xrdG05hlR6RiqF5BbKv8p3VJqkCcZ+znc0Y4pZpKc14pyBxanVXTkwpQ==
X-Received: by 2002:a05:693c:42d0:b0:361:167c:2364 with SMTP id 5a478bee46e88-369e845a30emr11787571eec.8.1793050487022;
        Mon, 26 Oct 2026 14:34:47 -0700 (PDT)
X-Received: by 2002:a05:693c:42d0:b0:361:167c:2364 with SMTP id 5a478bee46e88-369e845a30emr11787520eec.8.1793050486424;
        Mon, 26 Oct 2026 14:34:46 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d93663sm32084643eec.13.2026.10.26.14.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 14:34:45 -0700 (PDT)
Message-ID: <5f6a27c0-9e84-4314-b221-6bb9f82cb1ef@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 14:34:43 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] wifi: ath11k: Connect to the QMI server belonging
 to the device owned by this driver
To: manivannan.sadhasivam@oss.qualcomm.com,
        Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
References: <20261022-qrtr-multi-ep-v4-0-c6fdb75fcd3e@oss.qualcomm.com>
 <20261022-qrtr-multi-ep-v4-3-c6fdb75fcd3e@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261022-qrtr-multi-ep-v4-3-c6fdb75fcd3e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA4NSBTYWx0ZWRfX9g5gTVovr17A
 A0hVG2krF/n7U4JkLQYSuY2wbSuPQFC5cCX7PYGaNscgKNTI9beffTrSsz9mbS3EiNWnR2L6VD5
 tTQvxeyYHGvJOZDdTvBqvYrmYiNMz8s=
X-Proofpoint-GUID: DfjymU8mhlLOFRmQ4mHmwHADnp3khiy7
X-Proofpoint-ORIG-GUID: DfjymU8mhlLOFRmQ4mHmwHADnp3khiy7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA4NSBTYWx0ZWRfX9elrYfisHMPV
 +IN3eDbWi8RG7V1hRtokKQh6Dxg51x0mQ3hPAdhlLTGZJ5PvMdE4mWOtAUfP0JYIbmWfUVnmiCr
 ivu104HKnvSBiXbMUCNcrcwpbDC75MDhF/Jr/AJzqnHQ1KUJP4DSBrbPsIgrpjDLub2TW014pMM
 e+/e7I5U36cIL2Kfp92MLUYgXlHGeqgiX/pw/KEZbZ21/w+4l9CE1cP/PRy1S7sESa9RlK8Swzf
 6jkz3ETYIdJSV38ZlliWlwRWYnuz9HScwaQFBWcXRM1tWukLoGRnVgq6a6jocZ4sNgol0sCEcQq
 Xi8eRIKGc9ibfHMbePDCpb9R/q6t/3+xXqTzeUbyQ6+mcUaEDW20z0lkVQ+6bQvDGFvr1TREuWG
 ck3YvaxQHWLJ7Yim3v+KQotufRLEB26JA9D5TThk0eM4poUoo4hs6sN78yDXzAKUZsu6wpUgosk
 OL9Ib1bvRdDl/P/hEVA==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6adfc778 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=bQg6oyjaoxrshYPP:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=kpOCkfKLFM9ZImtyOV0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_143449_436110_5F89AE58 
X-CRM114-Status: GOOD (  16.84  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/22/2026 10:43 AM, Manivannan Sadhasivam via B4 Relay wrote:
> diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
> index 7dc07339b957..6d86e552038c 100644
> --- a/drivers/net/wireless/ath/ath11k/qmi.c
> +++ b/drivers/net/wireless/ath/ath11k/qmi.c
> @@ -3170,8 +3170,18 @@ static int ath11k_qmi_ops_new_server(struct qmi_handle *qmi_hdl,
>  	struct ath11k_qmi *qmi = container_of(qmi_hdl, struct ath11k_qmi, handle);
>  	struct ath11k_base *ab = qmi->ab;
>  	struct sockaddr_qrtr *sq = &qmi->sq;
> +	unsigned int node_id;
>  	int ret;
>  
> +	/* Identical devices advertise the same QMI services, so connect only to

nit: note that networking code no longer uses this block comment style, so it
is preferred to have /* on a line by itself

> +	 * the QMI server on this device's node. A node id of 0 means the
> +	 * transport has not assigned a unique node id, so accept the server
> +	 * unfiltered.
> +	 */
> +	node_id = ath11k_hif_get_qrtr_node_id(ab);
> +	if (node_id && service->node != node_id)
> +		return -EINVAL;
> +
>  	sq->sq_family = AF_QIPCRTR;
>  	sq->sq_node = service->node;
>  	sq->sq_port = service->port;
> 

Since the requested merge strategy is for netdev to take the entire series:
Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>


