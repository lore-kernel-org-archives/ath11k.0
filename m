Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2275ACA1006
	for <ath11k@archiver.kernel.org>; Fri, 30 Aug 2024 15:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=baFyKabD15U73SdQO8S2i0WKyu6HhFQ9NuAcYFga/Nk=; b=2KiRpnrAiJp3Q1fAQ/wzHWjgtz
	Kn9IL4NwKZ6b6sMIlj/+jpPS+Ed7vyCQ55sFchqIWQNYrC8x4THKA7h0DN/IAjdYU2G2TMY1dWpX+
	hnDPaxvbQpa6tUtEX8yFd9Ut2el6ila5ds3mrkdQJhonKymb5q5AQ+1Bx9nPnV5CBeyayvnouJXQ9
	k/2dHsKHLuSNkP9VhggvjEDHBjy/SDU6PwvCLuLaUXyiGOUPZIYypBGJi44WIj35JT2G6/4oY7FJ4
	EJrugoYEat0u72fNrXsocvBpEut0nN514HmpNCktKZj7z1qYu5sQk3mWuL3Y17gNMSy/HPi8VLR4J
	LnCzErcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk3px-00000006s5W-3DIY;
	Fri, 30 Aug 2024 15:46:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk3pv-00000006s4b-2Gmr
	for ath11k@lists.infradead.org;
	Fri, 30 Aug 2024 15:46:57 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47UFHHxI026726;
	Fri, 30 Aug 2024 15:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	baFyKabD15U73SdQO8S2i0WKyu6HhFQ9NuAcYFga/Nk=; b=YTox0qKSoLQgU35o
	nMQvPWULQ6Tb7q/0ht0zwXMcnneJCexsSIOmhPVfTTRRO6Z3pUMdBWDBp2bWs9qt
	9LRuzTSTZcAvNSnpJJDGMmsdNXfrfG2NP+4Vw8bv0l6CHoKNcQxsNjoulGhzHp5Y
	iHZ48yl04y0xj/dKfOjhcN41D8VRSac1zgtSqTa5l4XNsbhx1At0TynlCxAGhHSA
	HNqmuuQAFbPD4kXBP1XT8SE5IFSh0xK8GdSSE5Sz+iIE9Hi6KtwgjB6P9CiyFOsc
	sX3ck4p2PuEr7J9bN7rf0iDX78g1svt02RPd8jtHCqlwOCl6sW9d5aqthfZsnvho
	/AtHuw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41a612qapm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 15:46:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47UFkqHa025314
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 15:46:52 GMT
Received: from [10.111.180.95] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 30 Aug
 2024 08:46:52 -0700
Message-ID: <891d2bc3-9ace-4fed-92e3-192d8126c5c6@quicinc.com>
Date: Fri, 30 Aug 2024 08:46:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current 2/2] Revert "wifi: ath11k: support
 hibernation"
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240830073420.5790-1-quic_bqiang@quicinc.com>
 <20240830073420.5790-3-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240830073420.5790-3-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: P3z8TrqwlLK-NQgyQjZBRrbb26rY6VI-
X-Proofpoint-ORIG-GUID: P3z8TrqwlLK-NQgyQjZBRrbb26rY6VI-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_10,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 mlxlogscore=489 adultscore=0 impostorscore=0
 mlxscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408300120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_084655_740148_740F0CE6 
X-CRM114-Status: GOOD (  10.12  )
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

On 8/30/2024 12:34 AM, Baochen Qiang wrote:
> This reverts commit 166a490f59ac10340ee5330e51c15188ce2a7f8f.
> 
> We get report [1][2] that this commit breaks system suspend on some specific

since we have Closes tags I don't think we need these separate references.
Just start with "There are several reports that this commit..."

> Lenovo platforms. Since there is no fix available, for now revert this commit
> to make suspend work again on those platforms.
> 
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=219196
> [2] https://bugzilla.redhat.com/show_bug.cgi?id=2301921
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219196
> Closes: https://bugzilla.redhat.com/show_bug.cgi?id=2301921

I think we need to add
Fixes: 166a490f59ac ("wifi: ath11k: support hibernation")
Cc: stable@vger.kernel.org # 6.10.x: <hash>: Revert "wifi: ath11k: restore
country code during resume"

(Won't be able to add the hash until after Kalle commits that precursor patch)
https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

I suspect Kalle can make these changes directly in his workspace when he is
staging this series for ath-current

> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

With those addressed,
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


