Return-Path: <SRS0=ORoY=LT=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 923FCC48BC2
	for <ath11k@archiver.kernel.org>; Fri, 25 Jun 2021 12:34:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CAC761925
	for <ath11k@archiver.kernel.org>; Fri, 25 Jun 2021 12:34:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CAC761925
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yz0l7Sm8Xb1NmOKbdwc6/atLFXEAgxJhjAFxmHTESzg=; b=cgpXAv5u1rDYOZ
	/QuzjFPYc9EncgZvNR3KIYhJ4SmJwpuh+JtFQZZWDN4+eYkb1/nTqmEYuJ8/XxpnX9ZkOFzRYbjcl
	Zt/CnvAjGN7k83zz/1HsX0lmP393NyEwPN9Quk/ygilenJbiAELGMhz7+Vaafhg652mTYDdKQ6gf2
	EyRSRRDRAd9pjd4JQTeGQBNL59djtjT5jrRRu+5LVallxEVoJXJ6hXrekZ3FGC1wwumWOvTxJWD22
	pUV/lPJCMOPjoBF5l409CYxLW2j2mg4C4oA3o/P5GC4PTPBTSCp5atjUT+Xq32ZIEEUXq5j1ymI7J
	vdpJN88rPXr9NoebDZag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwl2u-001TNV-8Y; Fri, 25 Jun 2021 12:34:56 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwl2q-001TKi-FE
 for ath11k@lists.infradead.org; Fri, 25 Jun 2021 12:34:55 +0000
Received: by mail-pf1-x42e.google.com with SMTP id s137so306653pfc.4
 for <ath11k@lists.infradead.org>; Fri, 25 Jun 2021 05:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4vCP14x51ZT3xHTsGRwNOFfupBHNf+HcNjz+uJv37tc=;
 b=ktHLP1O9pdgttROJ/3d/zqYT2d35eagqTUHjpN0GfpcWbPh7NmalFXQtu1zu/5tXsw
 Xvbdhc4o67mkTGwm6o+sVB7IRHNMPMtU4HvrruA2ocB4SRyeqMtU8VsZ00zxspnkPavM
 Z60HD6xD5u9uBTB0ChMeaNa2cPkxVXw3wW2Ync+7cJu+5qb+VHjaPRyLjXiVgdXzKldw
 1EB63Ag0x8+SRu0ahaJJnn3nBZXkzSYipqu/XKY5IrbCXV1RM/6nGJZc8otYplg1zgiI
 5Uk/i8znvTY2xXXPPpmko1myRwptIkqzqj42Yr5iri2at2qR6RSBmHN5oUXnWSHaUmLZ
 SGjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4vCP14x51ZT3xHTsGRwNOFfupBHNf+HcNjz+uJv37tc=;
 b=KAk2uUsVxZuaw5FYaSC7gkYqAgqfa7Xdz0IVJTDlWkkASgA4FCtaBPxbgNCN+t2g+X
 FlqLcjbQnnU6ll6VZlgeBhkLK93Y2bAOYKEjpCcJkbosCIqS678Qxy/a/P0hq0D3K9kp
 rLXMQ02dB3kAl7rgkLzAyteNxkPMZanbKMHBjCZoNsZOAth27Eh0WqReZXI74IfpIJRy
 5GEIxLtGYycLP5GA3Lg+ghsS8/ejCGnvrZYSF1+O93UYjUUnJ61g2ZxB2ho3Xr+V04J8
 z+HMOfYTyehLhh4XOv39AU2XhjB4e7ea6Cxzevo9iQlTsS5ErK+9BoOBrAJgmDv2G2bY
 hjiw==
X-Gm-Message-State: AOAM532YFlK9dWUxOh2AwiO3cS3TNUFQYUeadUp5fAayiUOkDWNXM2Gy
 aUVLHloN30B1xH0cMmL7ZyxP
X-Google-Smtp-Source: ABdhPJxOLpaI+xyCcJi2T4fIruA0AEc9zcnx9kzOu5Fnn388vqnpNnzKNpU+fs7F08jiVCaAIDup0A==
X-Received: by 2002:a62:53c1:0:b029:2ef:25e8:d9e5 with SMTP id
 h184-20020a6253c10000b02902ef25e8d9e5mr10439876pfb.74.1624624491735; 
 Fri, 25 Jun 2021 05:34:51 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:600b:2a0:ed5d:53e7:c64e:1bac])
 by smtp.gmail.com with ESMTPSA id y7sm6077780pfy.153.2021.06.25.05.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 05:34:51 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: hemantk@codeaurora.org, bbhatt@codeaurora.org,
 linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
 linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
 kvalo@codeaurora.org, ath11k@lists.infradead.org,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 07/10] bus: mhi: Add MMIO region length to controller structure
Date: Fri, 25 Jun 2021 18:03:52 +0530
Message-Id: <20210625123355.11578-8-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210625123355.11578-1-manivannan.sadhasivam@linaro.org>
References: <20210625123355.11578-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_053452_544573_088A0EAE 
X-CRM114-Status: UNSURE (   9.49  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

Make controller driver specify the MMIO register region length
for range checking of BHI or BHIe space. This can help validate
that offsets are in acceptable memory region or not and avoid any
boot-up issues due to BHI or BHIe memory accesses.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Link: https://lore.kernel.org/r/1620330705-40192-4-git-send-email-bbhatt@codeaurora.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 include/linux/mhi.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 5e08468854db..b8ca6943f0b7 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -303,6 +303,7 @@ struct mhi_controller_config {
  * @rddm_size: RAM dump size that host should allocate for debugging purpose
  * @sbl_size: SBL image size downloaded through BHIe (optional)
  * @seg_len: BHIe vector size (optional)
+ * @reg_len: Length of the MHI MMIO region (required)
  * @fbc_image: Points to firmware image buffer
  * @rddm_image: Points to RAM dump buffer
  * @mhi_chan: Points to the channel configuration table
@@ -386,6 +387,7 @@ struct mhi_controller {
 	size_t rddm_size;
 	size_t sbl_size;
 	size_t seg_len;
+	size_t reg_len;
 	struct image_info *fbc_image;
 	struct image_info *rddm_image;
 	struct mhi_chan *mhi_chan;
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
