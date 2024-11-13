Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2A1D597C1
	for <ath11k@archiver.kernel.org>; Wed, 13 Nov 2024 01:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uXbDbEEiTa9fJcd/jlFzr++MTPHsqqWij8ewzpn3plA=; b=laTEZO4Oaee71HPcaR0C7YfkPV
	yULhpyDMGL+5b2sat2oWdXtilyGcxOU9dfuPSpEjlzn1u9FGMAUyyMaDGffqRS2ag8q4ojRD/P6DM
	wAjq/ioFsAB4QdWyCq1RVipfzlNvTeQq2HnF6lVPr6l0oIHoyNNu+i89Ggtc1bXFS8m/NCTnGr8vJ
	K6jFj+2I2zzf2P6ogdTxzEpSexnmnSPgLriYZblWy2j2GrK//ZAjUfgVvqluQLEIXz6x3rGM+c5We
	nRodC4g1tRWZfcfdIjTfDo8ema5qvfzcM1m5gyeaoJNh8jDvvmE4IbrRbdB4Q7RiH/SmSuy1QrO34
	/KdGGYsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB1lQ-00000005TKB-1Chn;
	Wed, 13 Nov 2024 01:01:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB1lN-00000005TJq-1zxK
	for ath11k@lists.infradead.org;
	Wed, 13 Nov 2024 01:01:42 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACMRqtJ003799;
	Wed, 13 Nov 2024 01:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uXbDbEEiTa9fJcd/jlFzr++MTPHsqqWij8ewzpn3plA=; b=KYNLcJLiVPP8JG4C
	SpWY+tyQERpagK+8QUDB0spzXFiSIce22ZF18QSPXY3LxZBdxM75Iv6Xyd8VeVKN
	WuZmort5NpvbDJraxgfOFkU6VESvIHDHEXSGZyLpWo8xIfROEBls3v8fC+lib2Ir
	nek6oAOpYrn0MhjDe1RfAsJh3mlS48VS9uHD7xCU5Sr8AEi9eGYTz8oG40AOLT7e
	dJM5F9JpYMoDYoZwuk/BPRCJH5DI9Ni0XgI3OwZhYMBMClXxvZhMMV6bgscmu8wh
	ypyMmWIjIiHnWqAglmBDbXnC2MScakdD/UpPb5FcjdGARVsMdkAs+Y9SzKDX6W0H
	E5UDVA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42t0gm110d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 01:01:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AD11dLe016862
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 01:01:39 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 12 Nov
 2024 17:01:39 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: <ath11k@lists.infradead.org>,
        Balaji Pothunoori
	<quic_bpothuno@quicinc.com>
CC: <linux-wireless@vger.kernel.org>
In-Reply-To: <20241030114625.2416942-1-quic_bpothuno@quicinc.com>
References: <20241030114625.2416942-1-quic_bpothuno@quicinc.com>
Subject: Re: [PATCH] wifi: ath11k: Fix unexpected return buffer manager
 error for WCN6750/WCN6855
Message-ID: <173145969903.2685813.5929707088344586586.b4-ty@quicinc.com>
Date: Tue, 12 Nov 2024 17:01:39 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8aY5Bgutcy8R8a9qHWD1ZPH3dzNm78a8
X-Proofpoint-GUID: 8aY5Bgutcy8R8a9qHWD1ZPH3dzNm78a8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 clxscore=1015 mlxscore=0 mlxlogscore=508 lowpriorityscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411130006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_170141_563150_155FD218 
X-CRM114-Status: UNSURE (   7.77  )
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


On Wed, 30 Oct 2024 17:16:25 +0530, Balaji Pothunoori wrote:
> The following error messages were encountered while parsing fragmented RX
> packets for WCN6750/WCN6855:
> 
> ath11k 17a10040.wifi: invalid return buffer manager 4
> 
> This issue arose due to a hardcoded check for HAL_RX_BUF_RBM_SW3_BM
> introduced in 'commit 71c748b5e01e ("ath11k: Fix unexpected return buffer
> manager error for QCA6390")'
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: Fix unexpected return buffer manager error for WCN6750/WCN6855
      commit: 78e154d42f2c72905fe66a400847e1b2b101b7b2

Best regards,
-- 
Jeff Johnson <quic_jjohnson@quicinc.com>


