Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0F0D767D9
	for <ath11k@archiver.kernel.org>; Thu, 31 Oct 2024 14:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8t0//s2p6v4uv3QH6EBO5L5mclmjif12h2X4xx7nKWc=; b=X8AQ/sxnsI2EM2tsyze050t0W9
	EWeP1rszp1vWwdiiuB+duCVYNyRPW/wQyOB7A/R9VsFjpNwMdsS5DVmfa4p4yshtBQ7LZj/CJxxhi
	Wwmg5HJmIUVMTQUzy0MG+WoAwaloAYxIfl9MZ1Nv+kWc7oyCSPG3XxIP8Qt3vFrYVze605nXDhFCa
	1pcBej1sv6JI19Ki7KPhu0SqItxnNCnJHM+YHhiHVjIgSPmffX131/YlvjaIvfTcMRzdnO1YwioGn
	EgdnKvct1tKcocbaIzlSLWPshSnlAbp5O4UH7aM/7PRo/B7xY4RX+sTdHxQqs7rpW7ZW/8CqYa1Di
	iI4F3XiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Wdd-00000003t64-3hZL;
	Thu, 31 Oct 2024 14:59:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Wda-00000003t5e-3yFx
	for ath11k@lists.infradead.org;
	Thu, 31 Oct 2024 14:59:04 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49VAVYLs012647;
	Thu, 31 Oct 2024 14:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8t0//s2p6v4uv3QH6EBO5L5mclmjif12h2X4xx7nKWc=; b=lyORiaDpi4Agu78x
	zVjoJg0uSp7KjU+OT2Jb88N2LiaXHg5VjPxEgPsZBVSe/zY8RvIz3ENpY44vviTa
	7vTkT9VQ0kUU7KE9inDQJzjetC2UkCbT7Tkg1Nb4RirVTKCKcqot8UGvyLDTbQBn
	ymTN2jDPkdJM1yhOkdhx5/2g7tdxfYjOD5Tmt6H9cX6soRb758ND3sYjKHdu1Y9G
	eKmfgr8i2L8jyi/FAiCDZxbsO9KXipbFSp/grkptRARuYNI8xj45gHYqOzhIJA7m
	W9sUwEKa3Q3MbwFpL6DM/mZv0iBqg09ZLvM8pKZXp5sIO0uO5ss4jozxO8vVCbnV
	kiO7Mg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ky6ra8se-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 14:58:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49VEwvRU017613
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 14:58:57 GMT
Received: from [10.48.242.225] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 31 Oct
 2024 07:58:57 -0700
Message-ID: <bb1c77cb-7efc-4c85-a946-5394b9105416@quicinc.com>
Date: Thu, 31 Oct 2024 07:58:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: add support for QCA6698AQ
To: Miaoqing Pan <quic_miaoqing@quicinc.com>, <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241031000541.3331606-1-quic_miaoqing@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241031000541.3331606-1-quic_miaoqing@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xvUkR7xcZWE866uKdW0vEvZpQ3NEQ1Zn
X-Proofpoint-ORIG-GUID: xvUkR7xcZWE866uKdW0vEvZpQ3NEQ1Zn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 clxscore=1015 phishscore=0 mlxscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=755 lowpriorityscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410310113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_075903_225905_21003BD6 
X-CRM114-Status: GOOD (  12.14  )
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

On 10/30/2024 5:05 PM, Miaoqing Pan wrote:
> QCA6698AQ IP core is the same as WCN6855 hw2.1, they share the same
> PCI device ID, the same major and minor version numbers, the same
> register address, and same HAL descriptors, etc. The most significant
> difference is that QCA6698AQ has different RF, IPA, thermal, etc.
> 
> Follow the approach done in commit 5dc9d1a55e95 ("wifi: ath11k: add
> support for QCA2066"), enumerate the subversion number to identify the
> specific card.
> 
> Tested-on: QCA6698AQ hw2.1 PCI WLAN.HSP.1.1-04479-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
> 
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>

Am I correct that this satisfies at least a subset of the devices you were
trying to support with the following?
https://lore.kernel.org/all/20241024002514.92290-1-quic_miaoqing@quicinc.com/

If so, can you reply to that thread, pointing to this new patch, and elaborate
on what is now supported and what still requires ath11k to support
board-specific firmware overrides?

/jeff

