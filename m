Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB2FD12668
	for <ath11k@archiver.kernel.org>; Tue,  2 Dec 2025 18:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sdAs0dnDIogQLGWCHgQe2HrkUPtRZeYZMCUBii0siA8=; b=WFwv4Hfc7ezuXWkcHN1MMkpPRv
	KRomZB2VHFYl9vjcizhtkIg+eYSqdQ2xH/FPsVEc5bND60dimYpiJdSW9iT/Eu6za2Mb3mbG2KbJV
	ciaYzyugj7MxjMtb7qyAnJvrXL+YRxY548ZBo+fMYIgFBItvAxSeFA0r/UhzFFm+RVoE3SnaXTQYn
	0JV54tJqL39xSj/hnvBhyhdNYLV+Gw95Nvx1aozdvDDBsjoCg8keQKM2hE7lM2EmIqJGdW4CGUKJ+
	BxvwpntZ5RBH+owvUzpB7x4x6dtqgLQK5JHQz86XDanVxvqaj2riMChZcoJXjs7gsGO2kFmh+FaUc
	HW8z6H4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQUll-00000005hMu-3ykj;
	Tue, 02 Dec 2025 18:06:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQUli-00000005hLm-3s4e
	for ath11k@lists.infradead.org;
	Tue, 02 Dec 2025 18:06:32 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2E93Fh2821258
	for <ath11k@lists.infradead.org>; Tue, 2 Dec 2025 18:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sdAs0dnDIogQLGWCHgQe2H
	rkUPtRZeYZMCUBii0siA8=; b=DZ/W2OoGO+EwpgHVbDwKw1ewM8mFMu0Od7VBIg
	h4SVSP56eUYfq3Cm80ql0MZ+wjt7shMnC3aDAVq96OO79jwAID2ZpXPTZkrpF9oC
	gr+6OJvBeRUDYeqSaG27bNbgrZ/xBMgAMQqFTFZMNJDer6KvSZc783+9b63PIpif
	M9nplnu9Gy5YeeuKiVTWx37gemCmQ8XszFwyqip4HjV0GIYSxDtuQpv+d7PQPbDy
	hjjOsRC7gOmklFxwMbYjbysBl2E6a5jUouAT75LUeIFeo/NjH8WGVB78oS22jEl/
	EdEbEveYeoxwmt/4sl6Yk4EeLd18Uw61T0zckMA61KWQRnBQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4astjgj9fr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 02 Dec 2025 18:06:29 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3438744f11bso9691030a91.2
        for <ath11k@lists.infradead.org>; Tue, 02 Dec 2025 10:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764698788; x=1765303588; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdAs0dnDIogQLGWCHgQe2HrkUPtRZeYZMCUBii0siA8=;
        b=iKVjM+R1QA1Ky8xABzqgeMKifzihzAfW4rU3LRlXOcjSb2AGbbgUNbb0Mlyb1tKv+w
         Klp0HQY28jPXmYljTnOum/GO1vbk+wHcMaamRZwLYqhpqSQUT/q8vRDtFw8oy9+gJmGS
         403Ekfn4IHq8FwJRJfOG7hT+Th98CmZgmWMSHOY54GsTbhEPtD8m4IAWq+GyzA0wNk/b
         fChLM3MVe1CLnnyXWbgOZu/mtiu6T4Ghu8Qys1evDMsdc4w+41LC4fv4iMfTOoUyJERr
         BOEHDzmugcYKzUP5CB+dSgukDG7RMNkWaV7WhbxLNICJ81iZzDtFlioX/wm5jDScRfD8
         +WUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764698788; x=1765303588;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sdAs0dnDIogQLGWCHgQe2HrkUPtRZeYZMCUBii0siA8=;
        b=MEbVQe2ez08FYINh9LsRvJRjSict1M7AW71F4hRtMXAxbkXZIi5ZsSojq0Uaws8W/M
         +MdPro/bSb2zLaraxRVjWqqWc+mEIyne6jradJv/AGPHE292XX+yDXJD6kkMXdl6xaED
         BouhxV6caGVs6bigWzEnim2X4vbuY3VkpchcscVhuEgj7vGIfQkFL3R4Z7VKvV+4Hh8m
         OTDX2d2shRNkRiG+3Qfgyu+pFk0wTzgeLXfFE7Q2lUKQbNcb+QOeF6UHz2kHgu/H22wq
         PcnRpnYZYbhV+px5xoObsvig4Uosa9zpjUewPxnxFIb8Hq+MkGZXbVDbQNhiievjqN0F
         w/Dw==
X-Forwarded-Encrypted: i=1; AJvYcCVUzbak1wSPlCD7oZfMhhSAjpVfqKDbbkLI0m+jbcuiBF9zingUy/PaJPIZNyNIK6gIIQv3LJU=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd/MQSmlOK5plQ87fqPTFb/Lsncqo5jFW9FWCcLMljFISroAlW
	OFTorxu3WHuvs4yDFCZlRsFJ74pfzOfy9vk9lpEgWuweUoJy1KJcA8VQAt5pckRgdogQdcnkfDx
	cnBJGfDkmHSs5tZg8Z7cNVtCx+gQ7IX+QBPFQ7pHvxHw24h67THHWgTqyUYW8sSIp
X-Gm-Gg: ASbGncvts8Tfz9pZIffP5XS8cNCg5jbUU+gODNyHJQji/M7xr53cN/MDNcIBl65amVO
	psyv9ojIGagoFc2IYbbuKKyerlGSFJZpmmOvXcRrIrSWB+8POqvmZcmR4qkK4mO1aBsFfJQ4rCl
	qnUQ2YyGaiEhqj19TXRbaseWQBsfGAv73t/48Ohf3MCZTCCh8sOnA2QPbbltyWG3nGQYalfpulv
	4p1gJ59cMjDeqhG4HXz9qQS+hW7sE2zJ458VPVXkXt4d8SQkgiyXw7J8txoKbt9OG7tArLt1rAW
	fqyNfPuDk+pY/u+seB6or35Q1MYbIGmfIx/j4GKCIbca4PRbjDTHsiCqcMlMG3yKeK902YgT2xA
	zaxAKpEVIYc7knU/spYPXGT4Zp4yNu2RuTGLPqLvYm9AmIQ==
X-Received: by 2002:a17:90b:4b45:b0:341:6164:c27d with SMTP id 98e67ed59e1d1-34910775f8fmr259205a91.3.1764698788538;
        Tue, 02 Dec 2025 10:06:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHd6+xbf2z4wsfu3GDzVS/La6L3U61jv3f7dxujiiHLeJ95eqqcLPHTONyg4VyfeA2+arbvgg==
X-Received: by 2002:a17:90b:4b45:b0:341:6164:c27d with SMTP id 98e67ed59e1d1-34910775f8fmr259180a91.3.1764698788018;
        Tue, 02 Dec 2025 10:06:28 -0800 (PST)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34910e9dadesm41153a91.13.2025.12.02.10.06.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 10:06:27 -0800 (PST)
Message-ID: <5d522aab-9ea7-46fc-8d46-00bd60bda496@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 10:05:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20251202
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: D4qXLXOVDYL-xVBoCz5HdWZo7MJMnN2s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDE0NCBTYWx0ZWRfX7YhkYvAlKP7/
 TVWcahm5Fv70xR6ioOQ9YoZ2e5Sfitw2b3Z68iDAjfnpuXh79x0S28ORmoJc4IqODXrj78NZlTv
 J3t1nHALglW1NxJMIe7u8a4Ow7vK+hgMTbPLJOQ/7d1rAYznP/oLo1SDzpN+qcaP4tEXvUk4UN7
 cf1c4PTWgN0RslLmbGvCkiu6LAaXaYArxti2MYU+qOSj0fwfM2ikPtJ5U6f1q4rvb7d4J2AQahc
 IenDxDUD7HKMVVK/RAEOEoYcMqbrvJy7bI5oFOuOInfHwNLzd0epgbAZ8L5EjF7rxFLdF7h6CyJ
 MkuaxiEcBWcaZthLJY45RWlxRqumNFOZbcFdccquGA6Fsty4eV6BYPxw1B0/yifsYzekGrKBj9D
 C6IMWyR3kDgepGHI+IDN5xIe1aW6PA==
X-Proofpoint-GUID: D4qXLXOVDYL-xVBoCz5HdWZo7MJMnN2s
X-Authority-Analysis: v=2.4 cv=EbfFgfmC c=1 sm=1 tr=0 ts=692f2aa5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=rMWBp-HL3mJ3BiuJKzMA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_100631_082248_AEF61671 
X-CRM114-Status: GOOD (  11.30  )
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

Hi,
Here's a new pull request for ath10k, ath11k and ath12k.

Only ath11k is included this cycle.

Update the board file for two QCA2066 platforms, and update the firmware for
QCA6698AQ to enable CSI/CFR reporting functionality for IOT products.

Please let me know if there are any problems.

Thanks,
/jeff


The following changes since commit 38c82f07a964e27c3e71224c1f038a4083ff58b0:

  Merge branch 'robot/pr-0-1764573234' into 'main' (2025-12-02 00:54:05 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20251202

for you to fetch changes up to 15f8543684412387ebfc97a4b99ecd18afdc5e0c:

  ath11k: QCA6698AQ hw2.1: update to WLAN.HSP.1.1-04866-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1 (2025-12-02 09:53:54 -0800)

----------------------------------------------------------------
Jeff Johnson (2):
      ath11k: QCA2066 hw2.1: update board-2.bin
      ath11k: QCA6698AQ hw2.1: update to WLAN.HSP.1.1-04866-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

 WHENCE                           |   2 +-
 ath11k/QCA2066/hw2.1/board-2.bin | Bin 745408 -> 745440 bytes
 ath11k/QCA6698AQ/hw2.1/amss.bin  | Bin 5005312 -> 5083136 bytes
 ath11k/QCA6698AQ/hw2.1/m3.bin    | Bin 266684 -> 266684 bytes
 4 files changed, 1 insertion(+), 1 deletion(-)

