Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FC9D2A523
	for <ath11k@archiver.kernel.org>; Wed, 16 Oct 2024 14:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rXy+c8dpwUyS28XWOvCP+X2h7aTUXs46tAhrIHKAdMA=; b=g6+yE143SAueONQXP6TjNTP4vA
	Y3DDD3qaSa3tecH8rc6Hm4oCMVqEEPhvkTJJPq63NE5FykYX4yCGtLdYPqVGmbUYHwDKA3XC8x0dR
	u1geBKyaHVTWZT9frF+s6AxrIZjDQp/J3FPxTkz8np7diDb4/gszx6okhRUa7Y5EFxxCcD3dPPkUK
	66pnWPuJfA46R22t9aTrZv7210eHxL93BGrt2FuxETdVJwMeOh3k2Fj//R75rU7Ytdfc5q4ckajBw
	aJlT+aLaSL3BGdYUI64Cg41czkgfK0nQqOaeulthV0kQYSy3nUCYnXC45o7CSMWHWjr8yu2z8aPDy
	K1j3hhnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t15D7-0000000C6d0-172S;
	Wed, 16 Oct 2024 14:41:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t15BM-0000000C6JF-336y
	for ath11k@lists.infradead.org;
	Wed, 16 Oct 2024 14:39:27 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GAIGvf011615;
	Wed, 16 Oct 2024 14:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rXy+c8dpwUyS28XWOvCP+X2h7aTUXs46tAhrIHKAdMA=; b=a5s93WzSKubHayJp
	/wPlB+VYr+ExlmTBql35B3ZI2DcpQab7CjIGvBldDPej9M2IaT1VBZ72g32+xOEA
	zk3iaaGDaEi/d3uV7vZXd20pf8539fEKyolWJfLzkOOKboSyK1GMSKfwKKLDh8Gt
	7p7FQtSl+4XL5VB9Sza3AdYQp26/XY3bQpbraBs5nJoJkxVU4vbpoUhblQOW/g0v
	fY+utrm4KHyzRo4eK1ixVLfdoqLZHn8GrwvSf3TKxn7eynOrPIvlRYmHivkmOzpM
	4SDw9Yq7LpEPdC+ZKO4YgyfZiyO0tJBouqtYs1qboUU3/Ndk7WEuJIaC77COq3+r
	EfyNtw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42abm5gv1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 14:39:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49GEdKJq031392
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 14:39:20 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 16 Oct
 2024 07:39:19 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Remi Pommarel <repk@triplefau.lt>
CC: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Praneesh P <quic_ppranees@quicinc.com>
In-Reply-To: <20240924194119.15942-1-repk@triplefau.lt>
References: <20240924194119.15942-1-repk@triplefau.lt>
Subject: Re: [PATCH v2] wifi: ath11k: Fix invalid ring usage in full
 monitor mode
Message-ID: <172908955984.387396.4029422650033805718.b4-ty@quicinc.com>
Date: Wed, 16 Oct 2024 07:39:19 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7wQfFCMJEt2iNgledcscv-bDehVMXvKN
X-Proofpoint-GUID: 7wQfFCMJEt2iNgledcscv-bDehVMXvKN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 clxscore=1011 impostorscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=949 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410160091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_073924_919136_C65F79DB 
X-CRM114-Status: GOOD (  10.65  )
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


On Tue, 24 Sep 2024 21:41:19 +0200, Remi Pommarel wrote:
> On full monitor HW the monitor destination rxdma ring does not have the
> same descriptor format as in the "classical" mode. The full monitor
> destination entries are of hal_sw_monitor_ring type and fetched using
> ath11k_dp_full_mon_process_rx while the classical ones are of type
> hal_reo_entrance_ring and fetched with ath11k_dp_rx_mon_dest_process.
> 
> Although both hal_sw_monitor_ring and hal_reo_entrance_ring are of same
> size, the offset to useful info (such as sw_cookie, paddr, etc) are
> different. Thus if ath11k_dp_rx_mon_dest_process gets called on full
> monitor destination ring, invalid skb buffer id will be fetched from DMA
> ring causing issues such as the following rcu_sched stall:
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: Fix invalid ring usage in full monitor mode
      commit: befd716ed429b26eca7abde95da6195c548470de

Best regards,
-- 
Jeff Johnson <quic_jjohnson@quicinc.com>


