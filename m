Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B26FC48BF6
	for <ath11k@archiver.kernel.org>; Mon, 26 Feb 2024 20:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Yj6uYUdFw1Hs2GXdSk1k/LtHQyQ3uk6ImZy/Jd9Yik=; b=XHE7S/byJaKBy0Dn0IoAJXGQFk
	lijr3TYNfu7jhN9nuG6FFyg4ovMTTcVCyZD0iiJF6buoQAZXtT4b2zAKGhYJmpDm9+19XSIpAGBZ6
	SErCwDaJA+wmkRffNTsOQcGtTNSNDlupVQEpqSpg/xXMaPcw41ixcaYSySIpTKuKH1Bxne8BSo+8H
	HwNbLsxMLabs4vuwqo9wO2WOc5BvKinfoAHkc2uG2Rn18muyklKyBxdltnuvQ+vYOk3V/8yNdSoky
	mVrL0Z/8LBeg4q9Mw862H5ilBxyXuNfasp/TYKLzXLtJfiy8LBLA2HSaAdOFmvZJCpzaCAsc6zeCs
	sTgMaZQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rei4k-00000002baT-2DBq;
	Mon, 26 Feb 2024 20:59:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rei4h-00000002bZd-1ngM
	for ath11k@lists.infradead.org;
	Mon, 26 Feb 2024 20:59:48 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41QF9bcq011111;
	Mon, 26 Feb 2024 20:59:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:from:to:cc:references
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=1Yj6uYUdFw1Hs2GXdSk1k/LtHQyQ3uk6ImZy/Jd9Yik=; b=hO
	UJEOl0zJ82Fn9ioQwgBI5M3n+wgD6wCihJ15/OBV0mU2wMm9Y1o8jQSIipLp2Rq6
	6366K+36iv6k/ffFVFlkbq0ytrhypmuUUUhTRQ2Q22vx6y2kt6IKsJaY/DNAYwLT
	JHIOBjI5CHDthE36s0iSRSHpN3DnLf1IGfebMyfxQeqxXU2ZtD5r3tyspLeXFMgi
	/unSdTFHd3FfXiE5iZYmSRg6gEMgfkgPFc557xXyMzSK7rnsxpi3ZSTobmhUwS6q
	iqhyEh2dEfYfkTfX6G054RxOvDRzKjEfX3BI9JkqvmHaA5x83d8ndYkhceA8iI77
	AzbRfrOQMLMxAZylkfAQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wgkxna34x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 20:59:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41QKxiDN006909
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 20:59:44 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 26 Feb
 2024 12:59:44 -0800
Message-ID: <c445dd39-5d41-46b1-8dd8-6a086f65d481@quicinc.com>
Date: Mon, 26 Feb 2024 12:59:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] wifi: ath11k: implement handling of P2P NoA event
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: Kang Yang <quic_kangyang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240226060203.2040444-1-quic_kangyang@quicinc.com>
 <20240226060203.2040444-4-quic_kangyang@quicinc.com>
 <032375ce-7dc0-4d93-9f26-12a6bb89dbe0@quicinc.com>
In-Reply-To: <032375ce-7dc0-4d93-9f26-12a6bb89dbe0@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Boo3V8Pr4n2FKA3SaNSqgld_Qrejbpjz
X-Proofpoint-GUID: Boo3V8Pr4n2FKA3SaNSqgld_Qrejbpjz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=758 bulkscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402260161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_125947_671545_F1AF733C 
X-CRM114-Status: UNSURE (   7.53  )
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

On 2/26/2024 11:53 AM, Jeff Johnson wrote:
> On 2/25/2024 10:02 PM, Kang Yang wrote:
>> diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
>> index 4c20202947c7..564f4a9ac8ce 100644
>> --- a/drivers/net/wireless/ath/ath11k/wmi.h
>> +++ b/drivers/net/wireless/ath/ath11k/wmi.h
> 
> drivers/net/wireless/ath/ath11k/wmi.h QuIC copyright missing 2024

I just posted the following patch (spotted while reviewing your series):
wifi: ath11k: remove obsolete struct wmi_start_scan_arg

My patch is updating this copyright so you don't need to.

/jeff


