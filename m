Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51066E7D0A6
	for <ath11k@archiver.kernel.org>; Thu, 21 Sep 2023 19:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bGu49PStgA/bfHoTL2ilYqnJU/2gR5Bu5vRDgI/kJuo=; b=OHOLVogm/VWOPx
	C4MtadCKhmfukfKRSVGCVgxQRUYxdaPSr5Ff6yeoWStgew6uvMjoGVuhs6D9B5Q/kxICeUf752i12
	bVH1wjgzDdqbr9Bxy4fyWbvgvwQfmkz9zjx3YLZm0kJy9anHaTnladlxJLXF7qAATgY/Wv/8Nh6iS
	Jl4YD0XooLrqXEEls/+x2nZCBRyDy4RXGl4ybvtHRUy76FWIjMod9yc5seWYreC7MgiNCUkaEvgc1
	OwxnY16i9X3lWhbCT87hnCn5fCGApAHTAghKuxPfgL1W2Nw+QPczJ0tlNssJd9ZjzI5lyhderFpwx
	FO+0D77uowU2X6QkiGsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjPkt-00713g-04;
	Thu, 21 Sep 2023 19:54:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjPkp-00712y-2a
	for ath11k@lists.infradead.org;
	Thu, 21 Sep 2023 19:54:29 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38LJ1203015172;
	Thu, 21 Sep 2023 19:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=abOzlHyrE9pNGaYVoAoNekhECNEcDtTHf8HtjK4+7V4=;
 b=TOMt4qeJs5qZtzoxsE2NyHiGf9hHmYHFhOa9TKwtxDPduIDQEHorIVDuoFXowRTW5l2o
 IbUfXOUfQusxzb1HGaixQKXdM+dNFFs2jsQCEGbeTggYmi58Nih3aiK3ty3PwkPRvIVr
 VhYZvZg1bq9HvHtQSVajOcan7mpph5fw3caD+UmPR87wO7P4KwuLtk5eljdWwF46YCrc
 rRZTE0V8l4djknrLZXUjQcl9cVes0QxCPerv5NL6z4W366KkCjY096B6wKnmxzxN9tWD
 +JbChiYbODPtfT+eAk0bbWO4W6kPenKcAWZJp2g+6uZFapt1pApirwaSUeLYYCZYD2Xt ww== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t8um1r359-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Sep 2023 19:54:17 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38LJs3bN001494
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Sep 2023 19:54:03 GMT
Received: from [10.48.245.144] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 21 Sep
 2023 12:54:03 -0700
Message-ID: <f9f0b511-74ce-4c3b-afdf-6352faae2ddb@quicinc.com>
Date: Thu, 21 Sep 2023 12:54:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/13] wifi: ath11k: fix a possible dead lock caused by
 ab->base_lock
Content-Language: en-US
To: Wen Gong <quic_wgong@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <kvalo@kernel.org>,
        Baochen Qiang
	<quic_bqiang@quicinc.com>
References: <20230920082349.29111-1-quic_wgong@quicinc.com>
 <20230920082349.29111-4-quic_wgong@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230920082349.29111-4-quic_wgong@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jSYuN3RPtFiUBI5XhgedGZJtHWKeA97z
X-Proofpoint-GUID: jSYuN3RPtFiUBI5XhgedGZJtHWKeA97z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-21_17,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxlogscore=768 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309210171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_125427_847960_F170B636 
X-CRM114-Status: GOOD (  14.63  )
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

On 9/20/2023 1:23 AM, Wen Gong wrote:
> From: Baochen Qiang <quic_bqiang@quicinc.com>
> 
> spin_lock/spin_unlock are used in ath11k_reg_chan_list_event to
> acquire/release ab->base_lock, for now this is safe because that

Kalle, can you s/, for/. For/ when you pull into pending?

> function is only called in soft IRQ context.
> 
> But ath11k_reg_chan_list_event() will be called from process
> context in an upcoming patch, and this can result in a deadlock if
> ab->base_lock is acquired in process context and then soft IRQ occurs
> on the same CPU and tries to acquire that lock.
> 
> Fix it by using spin_lock_bh and spin_unlock_bh instead.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Fixes: 69a0fcf8a9f2 ("ath11k: Avoid reg rules update during firmware recovery")
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
