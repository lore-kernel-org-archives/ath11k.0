Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0725FC54ED0
	for <ath11k@archiver.kernel.org>; Thu, 22 May 2025 01:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HPUGdKm+6wjWn2dW0R+KWWtLOsj1VrZbuMmjuk7/Syc=; b=Y5H0lHzuqgiWWSupicGnUTkgg0
	7Xk2EiYx8sZqqp2cWAZwMW7JuKzpLAwSTi3t6jjH3Fa/wg12QvuCvpoZWobhyh4FEBD5/J7bf3oBg
	JuYl37hF6TReibqzmTKMnMnL8h8RmAQbiYKEgtdbp/RXOohUhQ/nJ3b4r+Fw8p0LJtAwuQNmwXs/k
	ys1f7gTUhTVI0v8SeHbVtZc6lLJN2Bukgt26Aqwr+3w4vqDEF4caPB0Lnqpz4lVQPu/VltLaSwhZN
	FvFDV/T91jmTWNrUASG+QIbRb4Dc4+Nxlc0uLFPdsjwqe4SBXeEDJYlLOESCDsBNuIjCT4f/nBOyF
	nU2m8goA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHuq0-0000000HBqO-10pO;
	Thu, 22 May 2025 01:35:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHupx-0000000HBp8-021f
	for ath11k@lists.infradead.org;
	Thu, 22 May 2025 01:35:10 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LJ0GZp011336
	for <ath11k@lists.infradead.org>; Thu, 22 May 2025 01:35:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HPUGdKm+6wjWn2dW0R+KWWtLOsj1VrZbuMm
	juk7/Syc=; b=CB3Weyw+sfP0cfKIOVfUqmpzc/ZTtNMuemRT6UZvoDlbzr32mPa
	4hGOXCLAXS/fs721n19jgwFt3fjQW356eddsJrv/y4C6OPL0WX7gWUV0XwDcZ/6k
	jkmn/OlecZ/37kf8RioM+8m2q6rNX6iA6wrGc4ZkTDZ3gF6vktcPdFg46gkgZQke
	6qm7eX74b/04Mf2aUlY95msGMdlu/14pcVQPfsQ2+Q11okR48x4bAFu9bx6kHiug
	jJp+vZoCePMCcAvcdkVJ/05hSF8FP22YEGTsTJXM8ygOi703owddk8FiVbzi6ftq
	UDi8jB/+QOZb3nDSl0O42e6APTkholRsi0g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfb4keq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 22 May 2025 01:35:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-30e6980471cso5968113a91.1
        for <ath11k@lists.infradead.org>; Wed, 21 May 2025 18:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747877705; x=1748482505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HPUGdKm+6wjWn2dW0R+KWWtLOsj1VrZbuMmjuk7/Syc=;
        b=grJwU4+HSEJAxVESgvuJIlXASPWA+XrMOKWLCfgPzhYSy097QqFEMmu1z+HwJxByV7
         eTDoC2FvqaGLtqrZBn8v4vW2/wntPW1XfYHOFbiO63dwbuwepeVPHsurZyDfyi2PMm7N
         7RnNttg9O7DIwradzA9mUS9U+akjTi6L2O9KBbzK6USaBLJsme3+VWcpFDbNoAXFpNhK
         /abSGeHZvU20jKcRlP68R/oNEYIZMMC9mpdHYFaU65qjku0B4ZDIOW4H4FV3VC9ZRg4t
         +dPu3pMxUQ+iXekCEH3uyHhMt1SzuESi5rd5YyG1olFFLC0FZ8HO3nOc+Ru1tJZTvsrW
         WKFA==
X-Gm-Message-State: AOJu0Yyf6ANHxvW5B0c3ZSB9o4YVaL4BDU+ACt8XXv6MQ/PqHhhxBV57
	Rc6hcL/FPJPROc8EuifBQq8QrsGKnuerb43CPmDTamr/Qo4MoIYjfmtKPVJmeE4pkc959+9u3xd
	l2DZZa8Fc/W3SvrptrfDibEfPUEHR9BjEychk6FRAqKQz5wEC3ov/Dgy5NBf2ZVh+
X-Gm-Gg: ASbGncvQnYRIu0Dxvqkx+kvRpuRQAYx6U9zxSAarToB2kTS2ZJ6kZizHmExTYOk8UfD
	rBgZp1Caqh443SMj+KTzvApzr8ncDUr6J8tU0xy6ZcZwXL9eWRSjafTm4EhjwPsvC3dNES/SHP+
	Lrb0Y247RP+FUP1NYQHVmpwApvkZgFhjBn+lVJzQFqyrMHnjcc5CY6FaDCK+Wu6owa2LIKQWaYb
	Gs9p3Vprv+OsWSY+WnjZFqxmRW5VRubncuUPivaMlAbuBkjPCwzIIhUZhtBxXKEUmCa8sv26IIv
	2F7CGtKQRIjC7ylvEwsK6Rhu9e5L4L0C+R9eEP9+ks7ZZxeezOCdywDK5JvkRe+TJbuYCcc=
X-Received: by 2002:a17:90b:5750:b0:30e:3737:7c71 with SMTP id 98e67ed59e1d1-30e7d57e4e6mr33408567a91.20.1747877705471;
        Wed, 21 May 2025 18:35:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3oA7UpKoPxzuimQInRPDM0fZl6JIUILi/4VKjHEG11sIfyclQQp1d2zav0ocl3qvvA5YdVg==
X-Received: by 2002:a17:90b:5750:b0:30e:3737:7c71 with SMTP id 98e67ed59e1d1-30e7d57e4e6mr33408543a91.20.1747877705134;
        Wed, 21 May 2025 18:35:05 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365d45b2sm4341488a91.26.2025.05.21.18.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 18:35:04 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org, johannes@sipsolutions.net, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath11k: support usercase-specific firmware overrides
Date: Thu, 22 May 2025 09:34:42 +0800
Message-Id: <20250522013444.1301330-1-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IKDACCHJl413ZKFFdt8FTFazZ5UNEnS8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDAxMyBTYWx0ZWRfX6iUyDDnmiVer
 XJ30HNBrpGXdZ9incEUT0l9LpOS00iozTaeWUbfApN+Q3UhZBdFmgbjKfWOVDGwryqb+0WBxhtR
 le3+7FwTqjGh7kW0WoXMEIsTCJTPt0xWzbWUjQO3mwa2sgkz+2jojlKbgs7UwjTCzyNaO5jgPdf
 NDlA1WNHYo+1R5pjjUEzDu+wj5cig7wZIMhimmuNQIlauArhid3QuY0gRSXxBXe7VcEcaC7awzf
 nzbNagtloZoMqpb8JC4V1QivZ68l7p7Is2y3WlyQ1uNB6+iJVJXcP1Aii57Rd9CYfNfVWZ/tt5U
 urELO3rYUEHGauGj4V82+cKY5DEWDJsPmzu3alL6jf9TNjGr/bgKWQygclEKDLWBhFZqWZsD9Wl
 enZUqgQLCAJsG4lvV5L+Ab0YIAIE6TKJ1EHE4ZpWim+sdEmrGeRD/HZbU4WGWlD52wNBknkW
X-Proofpoint-GUID: IKDACCHJl413ZKFFdt8FTFazZ5UNEnS8
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=682e7f4a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=5mkN5bLxXfCjVL2fFVgA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_01,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_183509_173817_B48D2279 
X-CRM114-Status: UNSURE (   8.79  )
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

Introduce 'firmware-name' property to allow end-users and/or integrators to
decide which usecase-specific firmware to run on the WCN6855.

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>

Miaoqing Pan (2):
  dt-bindings: net: wireless: ath11k-pci: describe firmware-name
    property
  wifi: ath11k: support usercase-specific firmware overrides

 .../bindings/net/wireless/qcom,ath11k-pci.yaml      |  6 ++++++
 drivers/net/wireless/ath/ath11k/core.h              | 13 +++++++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)


base-commit: db5a2f8ef8d4be926d29ed62182d003110c1a6ca
-- 
2.34.1


