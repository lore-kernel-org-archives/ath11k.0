Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2299BD78789
	for <ath11k@archiver.kernel.org>; Thu, 21 Nov 2024 16:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ybsTrJGwpSAEtFJASHXO/mug9DwdeoX34GKgIEcllZA=; b=ylwQEowehTkV5I84RsRu34JLCs
	uNCD8uv/0t9lb7B7g+cy0tsi+QoyucJ0RKbQDdDi7OnPdhrmgRTt9lXM91NhPO3Ikq5qu9I0sAsxU
	KPecEIxUG/90wE/ptkp90JkmFVwzUK0hZmkWGhy6yPthB7773+8aikaAy6EIUauvUAV3+miItVnfb
	3zq55Og8a7z1NmXk/yaCtmqfhtCN6V/pjuyEC58p5VYBwbsN2702nhRnQ/6PN3DMA1S5946Hdoo5X
	BGvHbDAIcx+8N6twYnlxXMwMcvXRqMCXIJ8+ripVwDr5YzWgiXKTclWHTvvDPRFeAQyDRTSvbU03u
	WSD0eqWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE9nT-00000000QcB-3lgp;
	Thu, 21 Nov 2024 16:12:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE9nR-00000000QZl-39I9
	for ath11k@lists.infradead.org;
	Thu, 21 Nov 2024 16:12:46 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALA8OKo020278;
	Thu, 21 Nov 2024 16:12:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ybsTrJGwpSAEtFJASHXO/mug9DwdeoX34GKgIEcllZA=; b=IJWiAJlje3s4iExl
	q76KQS5v8osTB3/UafTzitrAS+345/qkJ+JEvOH2RAsMElzVuNVQ+C40AVjv4cZB
	DSAua3lH7USXKwsxLgnAtn/lIQqsowoGote9WsX31ALzwzNDLtUSDh8NWOx3Al8t
	cAeX/J5Wgj8Ppp1c76Byq2a39zoBUNy7HuFKRaM34Hg6LVLve9L51YkQ7AXVLigA
	53potx18sEFaHm//qz5GNHdYbaYIrSDB+AEBAXB3CRlVLy5tB5qqM1rLp4bZkvRm
	Pd6W/9S1liuqHzMEL7RdMFOcNegLg44Wt3xp7coxE9HBiBgcFBJ46hnjvK8uLL5X
	Z9sM0Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431sv2jeak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 16:12:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ALGCeJt002134
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 16:12:40 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 21 Nov
 2024 08:12:40 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        "Nathan
 Chancellor" <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Arnd Bergmann" <arnd@kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
CC: <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>
In-Reply-To: <20241119-ath11k-noinline-v1-0-4ec0a8aa30b2@quicinc.com>
References: <20241119-ath11k-noinline-v1-0-4ec0a8aa30b2@quicinc.com>
Subject: Re: [PATCH 0/3] wifi: ath11k: Fix clang+KASAN stack frame size
 warnings
Message-ID: <173220556011.3016923.10367972856606077534.b4-ty@quicinc.com>
Date: Thu, 21 Nov 2024 08:12:40 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -XETNq8xSJeBI4CoWdqMO6J2ZYGeYV4_
X-Proofpoint-ORIG-GUID: -XETNq8xSJeBI4CoWdqMO6J2ZYGeYV4_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 mlxscore=0 mlxlogscore=826 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_081245_913603_5BD3728A 
X-CRM114-Status: UNSURE (   6.04  )
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


On Tue, 19 Nov 2024 07:47:37 -0800, Jeff Johnson wrote:
> Fix the following stack size warnings observed when using clang with
> KASAN enabled:
> 
> 

Applied, thanks!

[1/3] wifi: ath11k: mark some QMI driver event helpers as noinline
      commit: 8ea1d2072ad1a9c24b326b50ebdc2c810c4b2cce
[2/3] wifi: ath11k: mark ath11k_dp_rx_mon_mpdu_pop() as noinline
      commit: 500d7ec88652ba7316e7fba334754e39e3177e4a
[3/3] wifi: ath11k: mark ath11k_wow_convert_8023_to_80211() as noinline
      commit: 4ba72ff2919cad90e1963b708ce23b92120613ff

Best regards,
-- 
Jeff Johnson <quic_jjohnson@quicinc.com>


