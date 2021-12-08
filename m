Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9EDC433EF
	for <ath11k@archiver.kernel.org>; Wed,  8 Dec 2021 08:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7dP1l7s7zZkF80Zsx9fhefV06irYJuPXOwv6Xl0aF/Y=; b=CRbXE+pd3KcGg0
	lBGu5LCZnAQPOm7Cvp2iDgSqCElcMplrvb2H9XN861WqNURl6y3ZAH9w0ouw7UWpPETfcYS8Ex2Fy
	RxTf3d/GT3mE0c4hy/9tgVHbl77wqo9pJo0cg4TiRnTbsx3/3GmtselirFHzbbPF/8LhIhXf3256t
	OkmcFDRnmOAQzOKwTGo+VsJsc3lFPwuxehlh8lZkyUj9wu9/1lMcafzeIjvihqyK1WL4ioDBf59hG
	ZZBqWbF2SJintoLh6lspXXb+SWVh89YvvO9FOixiMs4sroGCQ5t7ng37taTdngR/Z+MAIvMMZXs7u
	+kXaOAv8UppgHudbE/QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muslo-00Bnmj-6y; Wed, 08 Dec 2021 08:57:48 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1musll-00Bnlj-Po
 for ath11k@lists.infradead.org; Wed, 08 Dec 2021 08:57:47 +0000
Received: by mail-pf1-x436.google.com with SMTP id o4so1842154pfp.13
 for <ath11k@lists.infradead.org>; Wed, 08 Dec 2021 00:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Me9WYpu3noGP7R3Uc2V4qejvmKsuzQtp6WBHkL6JJ34=;
 b=a0P8vxp5qFAHEnKHmOGMQT6yYKt1f1YL0XbmxNtTF+S1sW523ENTwTLz4BgOnOyhna
 VeB1NKquPAcV4H/+yj9n0k90GyAYRgJWdWwxzUyno1sqpgJQrlxJmuxXUbVtJBvpYw71
 nEScK1bIAM7crMIJQRvRdhmUxvfNNS/cZzyHGEatuaG+sbDhw6ozH1UMv0m2Hy7C3LnV
 u6nH1nH9KB/9hhdg1h6oqkZ18n5iaNHiz4Zc5FxAMYvYmSZhwkUmOX5TecD8wMwb6pTD
 dPf9cf57dsBwutxmr5G3X/8GUsTzhVUuwxNKSSMfMSS0yF41SFLNcG3IUPbpTG4rgakR
 ba2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Me9WYpu3noGP7R3Uc2V4qejvmKsuzQtp6WBHkL6JJ34=;
 b=vulvi1AzS+NiXUIKfyV9WzNnK9/XOKj22nxs2IEhmMeEniJkLn3n/g6DmbjsQ+E2n3
 haxBj6fxGejS67+2McbxoFj0Lxb9rFEYVyREhxTY8Og+aurOH/kuRUV41ce+5a/IeECs
 AddeyteX+n6L6+xNgH3WsRvI4HpV7+pL7QNZqyatayOEBxHrbfv1dGh50OKiQarZS8S9
 K7auZ8E+t0WOpsWB6/7mqyF8UK/yzQb6F0/lHKUMUxPr6ABK8/Uh7VtztuyIdwCP6uTU
 4dMc9iFb2IOhajA9OsUel4SBs8OnRt34bFLbvWhC+g7rP/aTpP7G/kX519IeivIEHHIX
 fBdA==
X-Gm-Message-State: AOAM532MzJ2wsUhwvf9odVoJWYLYjZ2iqPiQCm+GRRJAs+BFOJ6pmHvm
 S2kGouk+vAoiqtf9SlyHyoZF
X-Google-Smtp-Source: ABdhPJzVkFfiD7oa8U3/B1Kv9DliwmeX3DMinwAptexT8/Vy4Y1y05AK4GkZo3aV3yxvCEC0A05hzw==
X-Received: by 2002:a62:82c1:0:b0:4ae:db0e:bae1 with SMTP id
 w184-20020a6282c1000000b004aedb0ebae1mr4473369pfd.47.1638953864414; 
 Wed, 08 Dec 2021 00:57:44 -0800 (PST)
Received: from localhost.localdomain ([117.202.189.59])
 by smtp.gmail.com with ESMTPSA id oa17sm2055470pjb.37.2021.12.08.00.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 00:57:43 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev, hemantk@codeaurora.org, bbhatt@codeaurora.org,
 loic.poulain@linaro.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, kvalo@codeaurora.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/1] MHI fix for v5.16 - Take 2
Date: Wed,  8 Dec 2021 14:27:34 +0530
Message-Id: <20211208085735.196394-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_005745_866796_2FB6EBA8 
X-CRM114-Status: GOOD (  12.60  )
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

Hi Greg,

Here is the final MHI fix for the v5.16 cycle. Kalle reported a regression with
ath11k stack due to 020d3b26c07a, and that's been affecting multiple WLAN
products like QCA6390 and WCN6855. The regression doesn't let the device to
resume from suspend and that has been due to a firmware bug. The device goes
to a bad MHI state during suspend and that can be seen in the MHI state during
resume. But that doesn't seem to affect the functionality of the device as it
continues to work fine if we allow it to resume.

Ideally, this should be fixed in the firmware but as like most of the products
out in market, getting a firmware fix for this issue not doable. So we have to
workaround for it in the MHI stack by allowing it to resume irrespective of the
MHI state.

Since the fix patch also touches ath11k stack, Kalle has given his Ack so that
the patch can be taken via mhi/char-misc tree.

Thanks,
Mani

Loic Poulain (1):
  bus: mhi: core: Add support for forced PM resume

 drivers/bus/mhi/core/pm.c             | 10 +++++++---
 drivers/bus/mhi/pci_generic.c         |  2 +-
 drivers/net/wireless/ath/ath11k/mhi.c |  6 +++++-
 include/linux/mhi.h                   |  3 ++-
 4 files changed, 15 insertions(+), 6 deletions(-)

-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
