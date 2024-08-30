Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5B6CA1008
	for <ath11k@archiver.kernel.org>; Fri, 30 Aug 2024 15:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ae5LxAkNZHRHOQ7fuoQQZYDjMyeeCDSLAMfw3mbSLQo=; b=1NvVkxfGcraIF2nk3vTsVSKLNC
	tBUBedIonRis0ydKL+1FUajwvuOOQyuE7G1ZlelO+1tCK+VKaDPs3NZDmZUWfDFV9zyWCq+oRAXqy
	8tBuYC2BGV3UPj0YmLAGYguqqgYVRnAVjGW3u3br/KukVtNXefN+NIOsrkJA2FKM6TFzIEDOF4LC7
	iJ9J7Zh4cPqYwNWQ5LjX9RcWoKSJlqGAhkkHI8E6llg8+dqRJRjSrRkHoPpyft4xOJnK0LFKYRCHc
	35M6LG4lhRzMZSXqyQJArbFkg6fmhi7lnD5Ob7pQYGHSeSC9Gv6TEHMKoSp6FepKiNASdaK7bBWqy
	c7pIonRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk41k-00000006vIs-1qVp;
	Fri, 30 Aug 2024 15:59:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk3zM-00000006uS4-3pOF
	for ath11k@lists.infradead.org;
	Fri, 30 Aug 2024 15:56:43 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47UEip4p030353;
	Fri, 30 Aug 2024 15:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ae5LxAkNZHRHOQ7fuoQQZYDjMyeeCDSLAMfw3mbSLQo=; b=bZfInti24Xc0ESCR
	rA2AA1nczEO2HbwRB1S3DO5ius/okVe/zGA7QA+B9mVIiNvytHr4TXj2RzV3t2u4
	W1SKbunKXojimK2LyBEeFe4djywQRsurg1fZLKyWgNAwjkbXtNsG4UVGM5sdOZYP
	FyMaiMzEHPw1uiaktO49buh94D36aYEItOnCiFycv2oq65LEp3SRQatVhJjlM5ry
	Hunc0vHT8SVkk8v1OiPUHltJc6hRrB3HGkoR+QG9DoVY/6tM4u+c2aMfaKfgpurM
	JRK3u8NRjA2SuKlh5dzixJqz2IC6VOcaXKpJnU3LQUvXjQrDM3zhLxHUsYzs9Chb
	iq/xdQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puuhbs0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 15:56:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47UFudws032270
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 15:56:39 GMT
Received: from [10.111.180.95] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 30 Aug
 2024 08:56:38 -0700
Message-ID: <1e5c40f7-d8f4-4e62-af2d-216d6e02dd5b@quicinc.com>
Date: Fri, 30 Aug 2024 08:56:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current 2/2] Revert "wifi: ath11k: support
 hibernation"
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240830073420.5790-1-quic_bqiang@quicinc.com>
 <20240830073420.5790-3-quic_bqiang@quicinc.com>
 <891d2bc3-9ace-4fed-92e3-192d8126c5c6@quicinc.com>
Content-Language: en-US
In-Reply-To: <891d2bc3-9ace-4fed-92e3-192d8126c5c6@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6HsFRIGe-kx-DEQNwo428w6Au8tyekwX
X-Proofpoint-ORIG-GUID: 6HsFRIGe-kx-DEQNwo428w6Au8tyekwX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_10,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=607 mlxscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408300122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_085640_996751_CC2E610F 
X-CRM114-Status: UNSURE (   8.30  )
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

On 8/30/2024 8:46 AM, Jeff Johnson wrote:
> I think we need to add
> Fixes: 166a490f59ac ("wifi: ath11k: support hibernation")
> Cc: stable@vger.kernel.org # 6.10.x: <hash>: Revert "wifi: ath11k: restore
> country code during resume"

Re-reading https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

I see that I messed up the Cc tag(s)
I think there should be two Cc's

Cc: <stable@vger.kernel.org> # 6.10.x: <hash>: Revert "wifi: ath11k: restore country code during resume"
Cc: <stable@vger.kernel.org> # 6.10.x


