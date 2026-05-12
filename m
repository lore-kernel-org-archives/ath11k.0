Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D764CD484C
	for <ath11k@archiver.kernel.org>; Tue, 12 May 2026 02:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OnJEs0Wj//JNnby7JdJtEwWZDbjb5cwkS9h/+IB7cXA=; b=x2T4ZAcLOObsk35QbvD/MJq9Er
	NXSuk637rRlBxrCfGQXOZCVSteD7NLLNcZU8fHvKCggG51a0DMSvct0TSMg3wMsA1FLY93ZA7z6B0
	fdSVXrw4SGlaULyr2lCJe4sjSJStdeGNbERrkiV3jg+/FuMeUyxaW+E1o3zoy3d2t7PkYNdSoTxFq
	nYXgf2cyyAquCaN/uG8zzJka0HOFV9Iogbp2enCRQ1E6Aebaa2pkT6rIcbky3yEBAXhnSDr35se61
	b+CRrnKq820V8sAdn7MRyiR7aQ5Hw/tNqQookeYKkfc8MFCI5dISHDe8QWVuLbmBwYk4ulDW982/t
	ZYsAyv5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMcmx-0000000FGKZ-0czx;
	Tue, 12 May 2026 02:24:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMcmt-0000000FGJT-2HMB
	for ath11k@lists.infradead.org;
	Tue, 12 May 2026 02:24:01 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6kF1866618
	for <ath11k@lists.infradead.org>; Tue, 12 May 2026 02:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OnJEs0Wj//JNnby7JdJtEwWZDbjb5cwkS9h
	/+IB7cXA=; b=M3bCmgqt9gaQScMW8ayQ2YfzJ9T9ghL080yfT0iRyW/Zps3KaLF
	lJKfp/mHHFF0BI7RbhfwEhEKt5kYY6UoaqMJPqsxwB4QoDGJ+IitiSWk8LVhXQHO
	25Hym6atLCAgrlGF2c8mP5SyRN2YyOsaemkU/4WrM8x0YvRQcydrp8cnAxCbkt7P
	WpHJ5Z2nPLbOo6n032Wa5LpiU0FHagnZBy+ppcvQDIEHo+p1UU7FUdLmzMhtEzJm
	Og9JQibHKxIvVfC5LGOC46e2jegeEmyw0ks/4BpSljpkDKbMiix7gbWi+QsugyUo
	m9mk1YVRB4AMYxxTtQMJFhugjOz6W9c3iDA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv28vs5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 12 May 2026 02:23:58 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8353fbc7ad5so2851330b3a.3
        for <ath11k@lists.infradead.org>; Mon, 11 May 2026 19:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778552638; x=1779157438; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OnJEs0Wj//JNnby7JdJtEwWZDbjb5cwkS9h/+IB7cXA=;
        b=Se0wtybl4UqJmRnP2AoqN/80AwNYRytWTGMm/Av6lOtQP5bwDxGOxEiQUZBXzT8Q9U
         9sWtufcYAQt3tWmgv7vINJzpxANzTatwv5a5Z1tBqbnpWnGbyNd9AuLm9rwzKvQUrFMO
         IsxSI+qWw8u56pFFLvAXLsQsF0HWIQkIANPyPyvXPMsJTwLn+UcDdStb4V4ZupVhdMte
         rGDZ64IequBlqXYIqeVfXSq/uv61awVRNcG36ctOD9S+6W+vtt0kxsmHhl5LZxoFfuqJ
         n7tLN3IbiTLAelCcRW3kVWyWAwovZaOoDzaIE1RvOoVgb4YREa5FshzWbt7s6Ao7vivY
         OBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778552638; x=1779157438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OnJEs0Wj//JNnby7JdJtEwWZDbjb5cwkS9h/+IB7cXA=;
        b=TXEBie3O/mnPb3XK9bQ2rivAmJ0/30JJSXXSuNEWmxUqWGlyRMeHsrmGZzcgjMC74y
         qjm4xE/ldVOvo4zkN3LQwN12EjZchuYSVMnTCCVSMZoVoGDwztCFtO6AYom1a2X3KZOW
         4SNN9E4suJG6Vid8N/PL74aK99igMOOZ/lkE6nzJTstXIPMDeDrXKtDCRH37LjqsxOOV
         NbsDix9kj1ueCNgABzqV9vpEZN6mmSVHJ4xVIA+swl+r0+APzId/ebW9BH07bdQX7EyM
         KOnBGdOu8NzMofDCgFvfod1KWyfm+gLc868v+ypQHDJItf6qye5iYey4wnzMgP5Zzrs8
         CTwg==
X-Gm-Message-State: AOJu0YwE7j3VOx34YdNHiGlHnGjachrIjviw06TRoXfbnpXDgxq9fMu3
	bvD+cT72KaErQ93BVSDZN7Y0ngCk7NR5D5QsTeUBZyYfsEls2Q9CK+VZwv3qWc/H7p0wsSmIf9N
	ObKQG1luMR5uVFN6Oscu1MXJjbxHKclQVwWpZ/CjfbLozFP1HNM37P9ZW6HYJKuLd
X-Gm-Gg: Acq92OFSbGeyCOWt+GfYDsVoCEyBEAd9NxQiDxsHl46yf4IlAO90z4W5LVMbtR89EYn
	J0tw+/MrWtdSx5uCsgLL5fpMxzuv3xI2q1+s6Ep+6ltyqvsYwFqb+mcvTVVl2Wh99te3FDnI8FA
	5LVITWdg+ESOl0UAlp4HVsAYc1yBRWYGVUoVY86JHC8292T+l59OD2DnPmsYlShVYrF0BbZB3pa
	55vGSXCVybkC/oHzCss45Kor2XgHFSRL4qmpWRBYFgIMriLwWhcl2K0S20vYK/FaopKoLTuiMLV
	DNDJpL6uQFPaSYRLvLnX2uphnup01wkK/681qkaY3lsovxGfw8V/xz59/d4YyR1Uure4jqf0fAY
	vOrMzQ6b8fTpk4uKcGWgRDuvZj+hto9UA0nD8+OX1Nred8s3dn4wmQEbKbCZUrXOUC3KTkHqGnq
	ztIHzm
X-Received: by 2002:a05:6a00:3389:b0:837:b97d:2fe with SMTP id d2e1a72fcca58-83a5b9d822amr26524038b3a.18.1778552637551;
        Mon, 11 May 2026 19:23:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:3389:b0:837:b97d:2fe with SMTP id d2e1a72fcca58-83a5b9d822amr26524013b3a.18.1778552636995;
        Mon, 11 May 2026 19:23:56 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbcf16sm25199256b3a.40.2026.05.11.19.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 19:23:56 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath11k: dp rx sanity checks for invalid length in error paths
Date: Tue, 12 May 2026 10:23:49 +0800
Message-Id: <20260512022351.2033155-1-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BD55TyC4Ezikw73hNo6KAVNqaRnJVrhV
X-Authority-Analysis: v=2.4 cv=Mv9iLWae c=1 sm=1 tr=0 ts=6a028f3e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=49tfinYE_bPl-5IrK10A:9 a=zZCYzV9kfG8A:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: BD55TyC4Ezikw73hNo6KAVNqaRnJVrhV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAyMCBTYWx0ZWRfXyTv/TfOrKFet
 RKVScVqPKo5Uaq/sWw6mzkfLeelTiDJIotgoFrwm0zaws1YYadsh5a1KYqPajFyq4RxY2MgPy1w
 cn1muAixr8EBhyWX/TxJILNFTbhTUXcRYkv/U+VsmLaOidmwNaInguuDqZ2sQwoA1Ti9pfcBLU/
 pz1qXGEX+wJrHUz5A7W5t7qvS2VvhBDGmGfW/hJX6ZWzzfA90iZKlzaOzBN0EO8QbUONO8vdUSX
 x7mtAcUTsCABcmQbiE6h01orOmL/PvUEZKxC/pfACxzGHTBZNhpq4+UCR/dlCW+VeXM3Qq35Upm
 JXB5K5XGjRsvc7ObkDOTdamd3y9wEV7HfhBDVAr+WKdNAqvDQfC189hdxAVqhzMm4vKr596yV6h
 1WA1Qvmt6tuJ/aWQOSbygmZoiMyRlPo535Hrj6XK3S9wQCQy6+a6+oDRm5dq4Sc9vhQpudAs1fB
 ri0jxs70vcHK4OTxs4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_192359_713089_683C9455 
X-CRM114-Status: UNSURE (   7.84  )
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

This patch series adds two defensive sanity checks in ath11k DP RX
handling to prevent invalid memory access when hardware/descriptor
contents are unexpected, especially in WBM error scenarios.

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
Miaoqing Pan (2):
  wifi: ath11k: fix invalid data access in ath11k_dp_rx_h_undecap_nwifi
  wifi: ath11k: add MSDU length validation for TKIP MIC error

 drivers/net/wireless/ath/ath11k/dp_rx.c | 59 +++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 3 deletions(-)


base-commit: 7b25796f571fc09a7aa6fe7efb23edccd326917d
-- 
2.34.1


