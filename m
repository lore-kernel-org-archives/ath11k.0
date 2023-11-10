Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A95C4332F
	for <ath11k@archiver.kernel.org>; Fri, 10 Nov 2023 16:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oz8PAidkcstHl3gTrQkf2RjFGgsH7eKmdptBB3bqDsc=; b=r9flYXFujdYk7S
	n5uxqF6Dii+v+qngNmE0XllbZBmBomW7nxQP/mAFNgsmN5fMu9kE6oQY5DCai1YZvv70sNdTH80gh
	HxlNrn71y1Ws5ylSgcLfRwZI6fiueaItZw6qzGnKSKxi9UvxOpudHwNzGMYNnk/0ZMht3tKevk8jd
	KnINIKI5l64r7lRE2brtsj1PWZlazb7Ijcc6fpffNCR6HMpvqVC/ra8W49RLO0/jyHHFpputrUk4p
	2MVXZCqNgF/DkKtr/lmbt5VEm/0NTnprsI2YS7YS4rMXj6kfMP2oGysubiQ1DZnPaKlyCU4wfpyn+
	DLkEhIP9czOvwqCuYnhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1UmN-0096UL-2T;
	Fri, 10 Nov 2023 16:54:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1UmL-0096Tw-0W
	for ath11k@lists.infradead.org;
	Fri, 10 Nov 2023 16:54:46 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AAGo4Bj028383;
	Fri, 10 Nov 2023 16:54:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0MXl5IoKGlfugAkTB/aoLGWF1iZC6IwTN9+zGwc3D18=;
 b=HEQMTcouWJBVuIuReDNmr+4GgwLmnAFIZlosNqYSLaXaWcnVzwqz0DHZZoP4TMscRWpm
 tjgH1ZjvotP0ziDuXvrzmopgyqeA2S5HhtP2KXnGNRL/uxg2h240ybSl0dU3uRao0g2B
 Udmq5lAE1jU+cVpshf37j38/zvDrWVr1RXkHwGZYma5TCfmxYZECZpRS32T/tlwqiEYX
 t2/rSopMvhJjpCOGeIr5jLXbzrErrCUHoVVgMHYvCwt5pLrmHxYaXy52IPtbNuQYRh/M
 XpBZZ9v2lgC1CJKaoGIMAv7xw9ejZI5Wg9dKte2bA/sqf8JwsSSjY+ZIAmWHSDD5tnuH 9A== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u9g4n17g0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Nov 2023 16:54:38 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AAGsbih025846
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Nov 2023 16:54:37 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 10 Nov
 2023 08:54:37 -0800
Message-ID: <f56bce13-bba8-40d2-1dfc-210478ff63d6@quicinc.com>
Date: Fri, 10 Nov 2023 09:54:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH RFC 4/8] wifi: ath11k: remove MHI LOOPBACK channels
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, <mhi@lists.linux.dev>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20231110102202.3168243-1-kvalo@kernel.org>
 <20231110102202.3168243-5-kvalo@kernel.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20231110102202.3168243-5-kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ec1OHPHEul-dZcOvkJ2LvXxkWVeFB0As
X-Proofpoint-GUID: ec1OHPHEul-dZcOvkJ2LvXxkWVeFB0As
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_13,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 mlxscore=0 clxscore=1011 lowpriorityscore=0 mlxlogscore=507
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_085445_339257_0B3D7D03 
X-CRM114-Status: GOOD (  10.56  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 11/10/2023 3:21 AM, Kalle Valo wrote:
> From: Baochen Qiang <quic_bqiang@quicinc.com>
> 
> There is no driver to match these two channels, so
> remove them. This fixes warnings from MHI subsystem during suspend:
> 
> mhi mhi0_LOOPBACK: 1: Failed to reset channel, still resetting
> mhi mhi0_LOOPBACK: 0: Failed to reset channel, still resetting

This feels like just masking a real issue.

If LOOPBACK is not being consumed, then the channel should never go into 
the start state.  Why would we be trying to transition to the reset 
state then?

-Jeff

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
