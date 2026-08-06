Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF29C55ABF
	for <ath11k@archiver.kernel.org>; Thu,  6 Aug 2026 10:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nlgUItZJi20p/1QnUqzNvFnZEGbn4NO6CQMmZuQlRVQ=; b=HGqCo29X8L877mH/A8TAS3y8if
	lyq9L6AMbDa7e9KyRfwkqRTUbzyL9tMCLoCpUHnayywlMRE+905tfQmKOmbfEHV/PfMTKysKhzzkH
	DmNxNVYqDndfNWDHG6aUvKivymwDIJTDMvMVYs4kcvjgaWdCnm3WmAolzLtuT8evvZ/OjblnxSZPG
	mdvmAYglH6n36kJOy8ZDjxFkToJ901Gzzgn5kgbNtx8++FSFK+smG4tBv2LGuD/zx0ulMuvNYSFQu
	n/NGWSHaDAAbTKmUoG/r+aEOlMuem40B59H0I9AC5Emkg+ix+5h0+nydjPhBVF3z+Sjw64ec8DIus
	bZuCc2NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrv6a-00000005Wct-3Pxl;
	Thu, 06 Aug 2026 10:13:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrv6Y-00000005WcJ-1dMM
	for ath11k@lists.infradead.org;
	Thu, 06 Aug 2026 10:13:39 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nvAC2725115
	for <ath11k@lists.infradead.org>; Thu, 6 Aug 2026 10:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nlgUItZJi20p/1QnUqzNvFnZEGbn4NO6CQM
	mZuQlRVQ=; b=CCFOmEOYr4KkZYLLNaquTMfb+X5C3doMyVCDR4tpfAwve1r9oeC
	hvoHZc9txUyx4en0bf6CXRIltQxQl1vzOaj29KFdOdlZSRhnvvGKiJcjp/p1pqg1
	osM7iarJY3voOMD9QbwNbGTDR91utA4v0lI8Z+O4HIGCHlVzY+Z8St2Kf/vg0mfM
	Lzzec/TY+Tz6elGla/4QMOoQlYVGfSfEXy/RHU70GM+GqZufjq2b6mVJqcqi6QLg
	VQGrKt/xUyZw0VIR6zDwvwh4JphSDw1Xi+OLS3bMRypP285P7pd3lXkZ/DU96+vg
	k7UdDjWbNRqaf8tRUoi41WSlMIq4nEwifdw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv9dmkn6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 06 Aug 2026 10:13:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so3055236a91.0
        for <ath11k@lists.infradead.org>; Thu, 06 Aug 2026 03:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786011217; x=1786616017; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nlgUItZJi20p/1QnUqzNvFnZEGbn4NO6CQMmZuQlRVQ=;
        b=kuw5BTdGxzbEMZTZ3K0W3PuiNDV6MJqHGoN8wfedgwtqxWSb7ulX6B1KlszUa9NrZm
         PycKWB5LnPHse6tJgPTae4GbcCBIrBwvdKbr4GczSNJy0xxYpTvhG19h3nMY9v1e7ZtA
         b9sS4g2CIV/v4hYf5m3jETqmxebKDL4MEC9ybAFOA/ZNH9CkkIdW6R4+vlwDtQc58EuG
         J8boIO+KqkDglxGfhYLdCewWtnBc/n4sYjp3aJwRFeyg9bqUP24PlAwCNbniiWyO0ijQ
         iPeCYueAvYVoQ4Hyk7mzhFZV0CuMuXTDHVaghrjsIyKRAwYsEfF6oyW2H9AJTH4QkJSU
         gdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786011217; x=1786616017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nlgUItZJi20p/1QnUqzNvFnZEGbn4NO6CQMmZuQlRVQ=;
        b=g7/tKYheIuzYPkvZSgP1vwlo2PXE9o+LEW/L2xd8ptxiFT5gzDtU+Wx24XTc3OPx0R
         zckyRAjtfwthTPFOxQSEPelOcra375YdLPFg+XYix3xzcQmEIiMqR7oy0tefZQeKOdc0
         5DxsXyVw30xmmLHlszr4Ra/MR1NgtErQSO6Z98oaTeHDFPJRjFkEhIPiwUD9blI+bb2f
         3LTPBbRwuMLqddz9GKJw2cfT48V+uqbUeoVuZ3HMfSJrwX8upjzODk276EdFe9A9ZS6Z
         ONWwksgaiweu0yWB31y9W8vUJB3z5NRMaDmU/Meo4zgPoTY20ZrGroYCaC+LHny8/J4P
         TvvA==
X-Gm-Message-State: AOJu0Yyjh8zjY/c/rf2xIX6Yg3eL3MuYHrF8+/lrXmkxaX+t52sbEDwa
	fzUMKIGMmRAOi7R7iv1/x4wV5d8KRNnx+UvC7U+Q77DxRH7ad+d/+zuy186jcZR1S/FOdtSY3WL
	/+dPhuwUo6u01qDA7Ct9BPAoCZz65THYxylYrtSaHYjxD70T2hy+GGiPgJbtDhlac
X-Gm-Gg: AR+sD10qi+IJFlH736mf9YqksKijbJ7HSkD851HNu+FRjUbACyNz/kQY4t24dLf5RBS
	duPIDvfYt7MjuYKS+YmKRT34rCGfx+/sCRk5ApsXtZbpENuuuLph2u+109lgm9Ru8nEPDyDm5dA
	TDVfrxahZ7akBIOg4zHgjF2Opb1gl86j7V/Hn92rykFdiQgb5U4JgAIfejTOhL0yogSfAvnV8TF
	qY1ZeGuUywNWwXnYfw5rV3i6pjB8/6iZOJ+efYZV+p6naqGkQfQdGp3+m23BAXPV4gwOUeS9BiC
	/+AF0bq+jbd3/2kuTy0HNUFZxhV6/yoL/7VqtLhoLkDqfdNFIYuABAVPpNKwGRTJSygl26H7Mlz
	IiG/AKSq4G1krsBXzildeVm103E8Hva/DHFILA6sue27v/AtLyn430yVclKo=
X-Received: by 2002:a17:90b:4f91:b0:37c:6910:5758 with SMTP id 98e67ed59e1d1-3903c542f55mr11253251a91.1.1786011216830;
        Thu, 06 Aug 2026 03:13:36 -0700 (PDT)
X-Received: by 2002:a17:90b:4f91:b0:37c:6910:5758 with SMTP id 98e67ed59e1d1-3903c542f55mr11253211a91.1.1786011216409;
        Thu, 06 Aug 2026 03:13:36 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085dc396dsm1257090a91.3.2026.08.06.03.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:13:36 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-current v2 0/3] wifi: ath11k: fix QRTR readiness related WLAN initialization failures
Date: Thu,  6 Aug 2026 18:13:28 +0800
Message-Id: <20260806101331.484063-1-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TJR1jVla c=1 sm=1 tr=0 ts=6a745e51 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=utuh3fF2I9Z6vZmf31cA:9
 a=zZCYzV9kfG8A:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: bQP3SNMujXmQcUhBiBJB2FtwqUmTQFXB
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4MCBTYWx0ZWRfXwwF3tDfvJSgC
 N+aMCIxA2fA+t++TXOs+fizBM04+nQ/lLQIsv/uWX170yKD+dhXIXl1s4Np+tANa2A++tiPgtxo
 qpk9elqn8adqV+v+4VJdIySHtN5Xo9k=
X-Proofpoint-ORIG-GUID: bQP3SNMujXmQcUhBiBJB2FtwqUmTQFXB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4MCBTYWx0ZWRfX7tyhS8zjMc7z
 w4RdfP5aOnRa2oBeg9k7qCngDZVydb0JH9OeRDufpKZd2gUTIHTLjmihgjKcu6Oyg+hLbIIq0U1
 gKHBENCwDdIj26rWCtW86g0iWp+RFYacexcIKJqsVL7Tl468t6XOXnXXtC3F16AfMyaUzKY478H
 qX6/Y3VWxrz7oaATKv5UEbL+Uk/I1YCLBVNe/keQ+bjNVHebRPu9cTMZyXFood+wxaUvMN69tJk
 IOAxGb2xNl2qHM/Z6RdweXJYJvTbSFHf0WAprBfLIpx1r5LvMFuAr95W2OUcamwBLuEiwgvIFmt
 IPsC3DSWVXcH6Dg8WyvGX29Nu/CD6KCx+opCXwqeH3zq7qi35FWOlFY+eO9B5oHSQSX+LAWRq6r
 KpTpDOmoctG2HAiK6/skjJ5NaNqIjVkuaqc61JPDe3ZHUcC9ReWwa4BrncxStddhyuwnosTJ3pd
 DKZC11tcni3Mwk0Qy7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_031338_431935_58562F27 
X-CRM114-Status: UNSURE (   8.11  )
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

On WCN6750 platforms, QRTR SMD may not be available when ath11k starts
during boot. If QMI messages never arrive, WLAN initialization can stall,
leaving firmware running but no wireless interface created.

It also hardens the cleanup path to avoid crashes when deinitializing
partially initialized devices after QMI setup failures.

---
v2: Replace the ATH11K_FLAG_QMI_FAIL guard with !ATH11K_FLAG_REGISTERED.
---
Miaoqing Pan (3):
  wifi: ath11k: fix sporadic WLAN initialization failures
  wifi: ath11k: fix NULL dereference in ahb remove when QMI init
    incomplete
  wifi: ath11k: unregister PM notifier on QMI init failure path

 drivers/net/wireless/ath/ath11k/Kconfig | 3 +++
 drivers/net/wireless/ath/ath11k/ahb.c   | 7 +++++--
 2 files changed, 8 insertions(+), 2 deletions(-)


base-commit: 0ece44d394570806e97c8471a50dc9f584516ef6
-- 
2.34.1


