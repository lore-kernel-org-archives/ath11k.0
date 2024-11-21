Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE78D78787
	for <ath11k@archiver.kernel.org>; Thu, 21 Nov 2024 16:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sFE1vS2C4MDgqkSY3PyQ517jzL+WlYJmSJUizwjEEWo=; b=Vs/HJUvTHq2CNIqmMnF4KpQ49s
	C5N2f1OH5+3xk+9P6+AgE81NhMYFU7VskuOxbfTtRaUXS7Dsn7XfWoDJNLd+U2PRCLfa2xz9JrMst
	WWc99jupouLnmbcXsy5xLi8wK31Gww/AI9IaPiPvHavl8S18Cc9DI44zdKMkFqsr8idznTHVUoY2u
	dezyRkCqFNPJriAajoS4FBaAhHjVSgMku74+seVOTcjyEE3sV/MU2QCu2L29ikPFBgZwNoyUgbQ6Q
	ka1yDPopsMTrHEcEOiJsujeC34kBO7U4BmJXkOE2B7oe6wuRUVoG9D0Uzce5sdyqKZVtF5COa4M3q
	EnPzF0gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE9nQ-00000000QZC-0bK3;
	Thu, 21 Nov 2024 16:12:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE9nO-00000000QY7-1REc
	for ath11k@lists.infradead.org;
	Thu, 21 Nov 2024 16:12:43 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL8l2P7003963;
	Thu, 21 Nov 2024 16:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sFE1vS2C4MDgqkSY3PyQ517jzL+WlYJmSJUizwjEEWo=; b=kKMwvUPHoOfZkDQP
	PVvVnWnDINvMCEREgSKe+SJjDB+XZdWCy+b4dQjgRrIvq3y0rbc2XI362pi74ZpF
	tcE44k2hsXAjXf15TunSJfgRFQW0aDSRI2qzck0HJ01gQVcAYsJo0k/rBct288AP
	0y1YeYDuKbirgLi9ma8ztLQhBotNJc94/+PAO7fAGS+fF+R/U8SH4AFdmnGjDX1r
	sqCSK/sDAWeXPmhTS2Z2oZVuY6vv8wjbb8S+7oHlmp2j4k0/pYYK89rWSsyPdWBv
	S4ZWFH8BURld+XN2mhqBMjWysgRQm1g6Yh8yT/axoWp1JPS3/E4isuAR24g22D48
	AtOV/w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ce3ckx5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 16:12:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ALGCdva031269
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 16:12:39 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 21 Nov
 2024 08:12:38 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: Jeff Johnson <jjohnson@kernel.org>, Dmitry Antipov <dmantipov@yandex.ru>
CC: Kalle Valo <kvalo@kernel.org>, <ath11k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
In-Reply-To: <20241111070152.85140-1-dmantipov@yandex.ru>
References: <20241111070152.85140-1-dmantipov@yandex.ru>
Subject: Re: [PATCH v2 1/4] wifi: ath11k: cleanup struct ath11k_vif
Message-ID: <173220555875.3016923.14494576340432634558.b4-ty@quicinc.com>
Date: Thu, 21 Nov 2024 08:12:38 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4yzAnR0_L0-wGXfVM6-ap4NDTBqgytYr
X-Proofpoint-ORIG-GUID: 4yzAnR0_L0-wGXfVM6-ap4NDTBqgytYr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=604
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411210124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_081242_389500_676946BC 
X-CRM114-Status: UNSURE (   6.42  )
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


On Mon, 11 Nov 2024 10:01:49 +0300, Dmitry Antipov wrote:
> Remove set but otherwise unused 'tx_seq_no' member of 'struct ath11k_vif',
> adjust 'ath11k_control_beaconing()' accordingly. This field was actually
> unused since an initial commit of the driver. Compile tested only.
> 
> 

Applied, thanks!

[1/4] wifi: ath11k: cleanup struct ath11k_vif
      commit: 733a8c69ded704616b864d30d2531d090ee7a57e
[2/4] wifi: ath11k: cleanup struct ath11k_reg_tpc_power_info
      commit: 95e5de4aae8ca1af851fc922a854bbe822bf2dd4
[3/4] wifi: ath11k: cleanup struct ath11k_mon_data
      commit: 93962446ef907cb169b089d0ff3f356e7ce004ab
[4/4] wifi: ath11k: miscellaneous spelling fixes
      commit: 8f5e8e7efb135fc648abbb572bd86d0c96819eaf

Best regards,
-- 
Jeff Johnson <quic_jjohnson@quicinc.com>


