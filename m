Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9493C88E41
	for <ath11k@archiver.kernel.org>; Thu, 10 Sep 2026 22:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e4FvO+R52vhSh1Vhlzg/VtVNHnWgOoy3sLOAYPmDuqc=; b=hcId5GXHTcdptahOHRRibN2MuB
	fVHPUFphhxkqce85c7GBb81T4ADzdXydg6dYbVSg3MLEDqIE0lQMNXxtSfAud7P+jbhOxxhXbgGAR
	i5byUhuUIWgAvylLLUsqq5epYF6oy7gfpIOWAfh4pgoulNH5lqO9ZwuQcLnZ+3nNz/oQvmtL7db8f
	yp2yH8V5LRCMAiBuMRsLzB9/kzyLP3KcfEwwOT9fATrFpPbgoLLHba9yAA2OKR7IStMBFwI8z7+S4
	i5zmDwaEW2aQJ5l7L4nD8i+wpiBugMDolsDZtv/Mq+cLjWptbJAjXoHHIkIDdy1M9BG59Hg2HGRv8
	peRqnYog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4nS1-0000000FUsO-21F5;
	Thu, 10 Sep 2026 22:41:01 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4nRy-0000000FUs3-3JFl
	for ath11k@lists.infradead.org;
	Thu, 10 Sep 2026 22:41:00 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-9399a1c21c1so21652785a.3
        for <ath11k@lists.infradead.org>; Thu, 10 Sep 2026 15:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789080057; x=1789684857; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e4FvO+R52vhSh1Vhlzg/VtVNHnWgOoy3sLOAYPmDuqc=;
        b=J19XLCvsLCwsC++ctH/c/VSw31w6XGNgAHvucj5pagtGS1VLgdiypnAQABDqWcl/wa
         YN2tsksYgFUilGkGn8tK0M4eDdw8ZoqmdLSdNStUo1cDm5r0uCTSHFaFqcW64SSvRCjS
         NftIm2/puU8VupmihDF8jSo97vpWKZv8i4mGYN/8qZrEu6UO3Amjo4SkA6ex7amTCvAz
         CXC2kz2WwhFek6hB2/cSx/BMdx/V/jnZ98zabKAkwtwLqk/1KivlwfCPPU/daLb2o+3B
         aNFB8uLhtkAeVzICSrF1OAn90v0ejRMaejy115f2JQdWGLV5OL0nr0sXVa9SGkR3EG13
         rg+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789080057; x=1789684857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e4FvO+R52vhSh1Vhlzg/VtVNHnWgOoy3sLOAYPmDuqc=;
        b=U7IhNlHZv6cHsjrDHoQYsgGbypxRc6fr5sTB3aSyrxJ8l6IEOmsM5j19NOGuJlZ5y5
         OD6sjGdcfSwa+GCIwlbELDniQkRJBai4N3FmXQBSmXSnfk1g3/4WDgHIfavGf74u5kf1
         Z9+WPNKtuBT67QXAfYw/Zf/Pu+gT1iNw1A/BRnUV4suC9osOalieSu6qr/IkPXAwwL1V
         qYkgj7MEODH/b8RYfr4THADxDOEIuB3NWz0Rc/n9ieRmI+mBk8pfVQED0gTD1jOaiEay
         /zO8oaSTMMEVpqoHL2jxE1u0k/VNnNSNYBOMYd+0Avv5Ajl4rBfKQZT55uuOndqpdQ0k
         nEhg==
X-Forwarded-Encrypted: i=1; AKwUvByJAtTsN3B1uYGm4bISlH2t98MOdwb3tABz5/EaijKTkV/tB1xMaxg5sZhPF9XGcyipE/NsdUA=@lists.infradead.org
X-Gm-Message-State: AFuF++mSdy9VzY/fjq9eLztE82E9quI3rJI0Sk7S1iEw5aQ4KCgVvcBe
	VJTVN9+X3mkkzDvkgtH+/zCCKiXlTibIjJXwtI/lIU0QIKJmmwp91/TarHjLjlA=
X-Gm-Gg: AYBFou0GytNpcpJi/OrV7HL+c6Gz7R0P4MuCAHe4NqzyETh2M30eFYbQBRrP/1TFWYJ
	o1NMCkWwKXHcdgc5bJsxFIPussFUqDGVWQQFMOilxfAhIVbVWai+B+b9oMNdQmDTvZ/xfKq9Jiw
	xkmidHe5mybhWyshqPIpWjFKbOhw0Qr+42jOhIl3FfXAx2+mxxj3QxrKg4GQag/k8vlOy55H/io
	JJ+b1nc+htCQaAPNKDAJa4upD3vdUh2hsx2Fdi4LOBs0M30hoGmX3E1oa6sI9i4qG+v8ygW6BzD
	Sl7ipedK3mSJA/H96WQpF3dAiQd1f0aVJbHuMg2Yy+XiHvQfzG24OYo8Fa9rd9ZtIVi8CtPm23T
	FoiPc5bR+H18073meIPoivp8wu5jbg0J2+gQCf0+9+htBaW4uU0iKZqGcDSBF1iLY52CpODPUah
	xNJ24BSyYuuhBj+2pssNPhW4+j0LZLJJ7magBQDqo6kQJoDmUMpFpmSQIX5vvUZ2L7bST2M9HKZ
	tIvBKrUwnE7l0FCjDzleXVFOsF2Wij/ye9LBverKSkCoRouOUCJLP/yoLSjXRYO4FLGfMyK404w
	ZN88u61nv5+sIvukxb+zp0jg8HuXMI40zg==
X-Received: by 2002:a05:620a:4089:b0:939:c1d4:e2e1 with SMTP id af79cd13be357-939ea229368mr153601485a.25.1789080057494;
        Thu, 10 Sep 2026 15:40:57 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939ebda519bsm21300385a.26.2026.09.10.15.40.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 15:40:56 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org
Subject: [PATCH] wifi: ath11k: disable wake IRQ on AHB suspend failure
Date: Thu, 10 Sep 2026 18:40:48 -0400
Message-ID: <20260910224048.10294-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_154058_866818_7FB5E7D0 
X-CRM114-Status: GOOD (  10.07  )
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

ath11k_ahb_hif_suspend() enables the wake IRQ before sending the SMP2P
power-save-enter message. If qcom_smem_state_update_bits() fails, the
function returns without balancing enable_irq_wake(). The WoW suspend
error path does not call ath11k_ahb_hif_resume(), so its wake IRQ cleanup
does not undo this enable.

Disable the wake IRQ before returning the SMP2P error. Warn if disabling
it also fails, while preserving the original error code.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 69ccee619a38 ("wifi: ath11k: Add WoW support for WCN6750")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index ec5bf5c..3c9de95 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -742,6 +742,8 @@ static int ath11k_ahb_hif_suspend(struct ath11k_base *ab)
 					  ATH11K_AHB_SMP2P_SMEM_VALUE_MASK, value);
 	if (ret) {
 		ath11k_err(ab, "failed to send smp2p power save enter cmd :%d\n", ret);
+		if (disable_irq_wake(wake_irq))
+			ath11k_warn(ab, "failed to disable wakeup irq on suspend failure\n");
 		return ret;
 	}
 

base-commit: 08df884136f1c1197bab2a27814404fd329d9aac
-- 
2.50.1

