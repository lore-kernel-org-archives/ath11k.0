Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5859CD8CAB
	for <ath11k@archiver.kernel.org>; Mon,  8 Jun 2026 13:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1JnV+L2QiJG9BruAfU9DnSDRh/wgHdKyo+tpx3iTvw=; b=3hHmW9TPqkzwq207xqHriuRMAG
	jGoyfm/qtztOPZZQigZfdDm2l9FQotTT8nbiPUjvyeDi2V1J5x4zVGSqIoBqdjrzSWktN3mH9ZS1j
	zRaDevoCLiasDK0CEqFjy4W9MArzjk2Ub2hET8htsA5Kv8pJ1EOrngK5VV9Mz3JZ/wARqh1Um90cB
	0WvO2WRNiChb5d8Z788CcQM+FxZdphbzUBNE7tFE8HjXbWzKakkD/tlx8PmR48KDSbqV4dIQuzj2w
	LoJNxyKUVXJMsCkq6jekb0R5UA1OkEUzEvgIqX5Nyl5uCD2smIyx5JdmVxY+kmjnSJLCaNyNBlcWE
	WaM4I+uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZvZ-00000003bzE-1Q1q;
	Mon, 08 Jun 2026 13:22:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZvT-00000003bpm-3ybs
	for ath11k@lists.infradead.org;
	Mon, 08 Jun 2026 13:22:02 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658BBv7g3459841
	for <ath11k@lists.infradead.org>; Mon, 8 Jun 2026 13:21:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+1JnV+L2QiJG9BruAfU9DnSDRh/wgHdKyo+tpx3iTvw=; b=dmjFTONZoYj83Me6
	pAY7niq9uXjobmrkbbOifA2pJVVWZIsgJnHiidXr93blZZDg5Y/7u3AYcPQFJ5WA
	xxVQoKb6zjwqeikNVGv0NJQfHtpvkxAM60FORdmTUrOC4VCr9qGSvOEjWuIcqOWp
	Lrb1jfnjAyMylL3aWXMiCWEtSAWExxTo8zxlgUu4hYsmnVqRH2iinZSve8w6stWI
	TMTzU5ZeZJk/WoPwTy4iTQPT6sNjuuBjZjEgvBwZnEvPrPP8CKxu2DUdHyFv1w4t
	zfnTwc9YVUF44OhBoD0MJZHAxNveiXnHfyPmJIYBCkgzkLvWPqsDc5nPggbg7uIe
	+wfJOA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun8gu02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 08 Jun 2026 13:21:58 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3074797dfa9so5902032eec.1
        for <ath11k@lists.infradead.org>; Mon, 08 Jun 2026 06:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780924918; x=1781529718; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+1JnV+L2QiJG9BruAfU9DnSDRh/wgHdKyo+tpx3iTvw=;
        b=KFJz007d2gBHHMDZGhOdlwsp2umZfcLu3p8H9I5na6x/Lgl4ifWVFYrZTxnGPF7P8W
         2Nv1J0p2+uh8DCgQFG5cDQcO8qQMh3SUnCCVrZfavF6dNqKSxltCZa6Lim0vSNKXoWP+
         Dx6uDPAR4VTfub9pqW9DCKYMBAj4qWiR/y9XGQIXDqCCZSeRJ5uLreLgyEmdysVijcXF
         WGy4p02axoWGuvOu40jnjVhdjt4+rUIKmc42QVWjlyRZg4uz0kahlSnrT9PPuUtM0sJw
         BGlH0x5iVOstUFhRKcKljgu3a2E0Vp7gpU4/sc9uLwfq5BzIjZfq3hh+dGJKFjrGZcxe
         nmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780924918; x=1781529718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+1JnV+L2QiJG9BruAfU9DnSDRh/wgHdKyo+tpx3iTvw=;
        b=ck+g24C3XyT+Lfp6N2zikzK35TmhV+D9cyXMek7MPp/4rLmDh3+maLnSfISz+2VzyY
         n29FLQ9LePJV6qFPBFJdjQ7BoqkY4QRwzQbiJi/t5WvaoXYONdp2QsoAWZwHMmW5hz8a
         wQunyL9V2z3oyj+37CHXYJXApsRyWyFEnT3z5l98YfRMnQTMjAUfrV/dFSZxxDk0G6lo
         nPZvLJszoDjAEINiutfj9ErX6oO4+GTxvCCsZpN8iFrPlpCimgHH5k7ypNFC9/xhuFIR
         b/3g72W/QlqAne05iKmsa1NulK5BWIKhDfmizvtQB97BfXfCZvupg0i/B0tPXV5Ow/bF
         yNyA==
X-Forwarded-Encrypted: i=1; AFNElJ/olp3e7Wu+cifryf+8WDwq1WNq8kCiimYUPL5lECQcRlvsuMSPoQ22R7D/WCwTUZE3HYLWSUU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxvRJf5ou9XIwPZ3CXPsbbXtvgc0pfaXPtESGRWzfwC88kK1YLv
	gAmTHk1IyyAjlTBd+QRY+gz6bv5aZCFDHFc8B+tLFHEKbArMnRiYaF+TBo2FQN1A4mmkLWdmXch
	Jvb0vdScSew97BbCbpVtvlu9hniguhFezYpXv/LJRrYWEJBRsOx5xaLvegZlUdtB1zz1blnIO
X-Gm-Gg: Acq92OGPbWIV9Thl7WxokpYBQdcNx6gDRKn7oeyanJdIR14s7OXH5FmpyUsefDBtMfm
	ZgAU/7BByqi8Ydb4nubfGZCgGec3sFl+h00zFE2PkCBvg4vZlyH7bayqQnNdqhmtmB4zYfXayXO
	MQ/u6ptMv+P3rXf8mboyruuoJw5sG2uxmZ0+c0oNeVGdumX8BCu/E5pOx98ZjoN0CDcryn9Y2q1
	vy3Lia254HcHW59OOQk3bU8D9sydL7GnXZErLEjXvm35uKrNhxj42ZMHXkTdV+jvOkp91eSHr5/
	mOLekP44qQoJm0NJiszmDuUkxqFJ2wHJBGXsBi0+5zxpR3hi/lMGtGSsZ/wdTr9efUhEHASJy/q
	TkhIo9YrPuwmAzqmWoT9UpNbrIU1sK67TnDgRT7ZypS9jazzg5nxtMnv3ZXNrJ9lpkpqIZF5Ajs
	xetLGtAwBRGLo=
X-Received: by 2002:a05:7300:8cac:b0:304:ab8:f87c with SMTP id 5a478bee46e88-3077af051efmr9016476eec.12.1780924918019;
        Mon, 08 Jun 2026 06:21:58 -0700 (PDT)
X-Received: by 2002:a05:7300:8cac:b0:304:ab8:f87c with SMTP id 5a478bee46e88-3077af051efmr9016453eec.12.1780924917534;
        Mon, 08 Jun 2026 06:21:57 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dcbe995sm21607280eec.13.2026.06.08.06.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:21:56 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 06:21:35 -0700
Subject: [PATCH ath-next v2 4/4] wifi: ath: Update copyright in
 testmode_i.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-ath12k-copyright-v2-4-37504d70b03c@oss.qualcomm.com>
References: <20260608-ath12k-copyright-v2-0-37504d70b03c@oss.qualcomm.com>
In-Reply-To: <20260608-ath12k-copyright-v2-0-37504d70b03c@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath10k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEyNiBTYWx0ZWRfXx7WN6RDScJKo
 3KYhIKxiLokzdMNA4iH6EUuloiR+uLpbUainhNhs8s+nmFjjF472YMIViQc/u1/8qzSiPGT/87d
 b2xfqnSoR3s1mCOWObqYRy0zwmCxQN8/0WHIiBxIWnvITqtlZjt215xYKXCoes5X7sXOPPUI57+
 mTu1pYDMu5sxUWNJrstI4TxRwedFEt8xC/o0DhG01Ks/qTSqq0h+i/ANCbCyizJgVnfbO47OWDR
 vrEv0W/qvHxdxvj7FMjwPdaeqwy9v6L3Tj/OkWfhcNNuhCRvFZJZarHEhhxD+EJFb8n8amqcldB
 YAcfm6QUe0Tlz8f+isdC9XNYv0AbheqKY+CvBkmkdbNgI0CZXC/uR3PF7yX8umOI7Qpkv2Hur11
 aUCGRCDiqOb58tRbOz+FTkn/5s3Asu6Rw29YygrQAhTTiOW96KeU9BWEC46XkOKuJDFYDaRLGrM
 OeBQ2zZv5OZXw9Wg2PQ==
X-Proofpoint-ORIG-GUID: oCCs6W_fdkSWrH9P4uVLtONh-LvajNHc
X-Proofpoint-GUID: oCCs6W_fdkSWrH9P4uVLtONh-LvajNHc
X-Authority-Analysis: v=2.4 cv=Z7rc2nRA c=1 sm=1 tr=0 ts=6a26c1f7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=E4j0M03IeE_1wCd7Dv8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_062200_121917_06BBB775 
X-CRM114-Status: GOOD (  12.75  )
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

Update Qualcomm copyrights per current legal guidance.

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/testmode_i.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/testmode_i.h b/drivers/net/wireless/ath/testmode_i.h
index 980ef2f3f05f..78109d21a655 100644
--- a/drivers/net/wireless/ath/testmode_i.h
+++ b/drivers/net/wireless/ath/testmode_i.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2023-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 /* "API" level of the ath testmode interface. Bump it after every

-- 
2.43.0


