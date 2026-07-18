Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11677C4451C
	for <ath11k@archiver.kernel.org>; Sat, 18 Jul 2026 07:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uaPspb0vOFkRyG1Ra2k3lDnMsVMESB6T2yn/LNmYQss=; b=S1qh5W7yWufqiiZoL6Qp37krjq
	nQOKUj5RwgoBetl+gC1mmsT9qcmT85nXabybedzmq083XRUQAGJbMqCBeSq+24LzJLL+cAKih35Zm
	tMG/Pe+TqvzvPxLh72EEAE8OJXCaAzWDMsKl3WOWrQe1eka4Z8mGUFITtsC+hH1sBrnCRFNfFj0PW
	1av/rG0Jyqpy0IkbQHXkS+Y5LY/3LskmsyC9HqlGcy+gGBzWVPKYmADoDTuNooB8w77Z0uX7ab27N
	C1Qw3ZcZr7CIdH3SpCB1dUH2TRxlaWXP+Znr+OmIfFuTaZ7/TH8ASTqmhscyc3dTXiEJVgTuRdzRe
	PDizedEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkzfB-00000003qUq-3om1;
	Sat, 18 Jul 2026 07:40:45 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkzf8-00000003qTt-1Hwo
	for ath11k@lists.infradead.org;
	Sat, 18 Jul 2026 07:40:43 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso96434505ad.3
        for <ath11k@lists.infradead.org>; Sat, 18 Jul 2026 00:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784360441; x=1784965241; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uaPspb0vOFkRyG1Ra2k3lDnMsVMESB6T2yn/LNmYQss=;
        b=iYQa9DK4lI9vO0k5PBvPbiuXJ1/HPrl9RdlfN1AITqqJHDSp/EggH7/80Rsxfbv/gj
         9ErDS+rHhJvKnfpEsOUpUAP9XkwRhTbKW3ge+ehaUcIr7ZtAWm0aYXM1zgIGUX7rXb3W
         t7IM7ucbnTvOdYbL9iRwrG9lOkP/AqzwZH8GqbZxkgSyG1b7VrWWLG5P7enMWcgjhFYn
         XZgUe+4D2I6DNJbuINDAqZ9KBi/xX+iadqUoH+AebMaCYRueJEyQYsaDc0XYgqdc37we
         cnBx2BhSVEfVLuHKT0aY8x2rKLCOl7NGLxlBsuAj93/yxJ/YWtWRy6Djm+pc3JLwEzqb
         NLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784360441; x=1784965241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uaPspb0vOFkRyG1Ra2k3lDnMsVMESB6T2yn/LNmYQss=;
        b=bKe++2sNS8XsY2ylBvDMa0u2rhXSk9kGoH7uxgy5mbU4Zc/J/TEQa9dzse3aJyMPKQ
         9UtI2XrU2ERDSJ+B7coIqF9xibLnZfKpAsiZTULpQ2tHCU7tLhIGvQw6IKvchgbeRm2o
         qryrNy/HuJTKCx3M/71OYn7Kx/6W3HtAFkrb/Oh03ae+zOy99DoHXt/7kNibUcbWc4yE
         RV6875JTtxuwhVHzILIaZqFjva/PJF2D6FdXbhVPjwHG7dhpJgum74uWk7QCvscNQQCs
         dPgxr/QZreF/dWFIQ6x0GM+tel9BddTX4dF9re0RG201hCOqxO2Cbv4gzkpfiyx9y4i8
         TM5g==
X-Forwarded-Encrypted: i=1; AHgh+RqM5vKljVyW7zyH5SSUoYn6/+X+2HCTdN6GPB0PYQ/g4bI9vdE1QdQRBQe6cG+CID+Fv1d0G5U=@lists.infradead.org
X-Gm-Message-State: AOJu0YxloiebbcXV1VHtyz6DjspEcvSETZaC4s5XXTUOzzK00DfFqaQ4
	XF2VDFCM+aB/rVf2OmTjzHMY2iAZQunwmdvQ3OJ8hU8vlAbvDs0WPw86
X-Gm-Gg: AfdE7cmtEP8ICuorJHz52cZdk8IE/Le1WnRr0dP5Qzxje8iLTgLEU8hcXnbuvMId75c
	eqXlVlWt2qjYbvPm9s5zS1IkKmuUvw6yCKESuJdyK7Dm+3/l4npmq2xmCBtgY26oopLmNIJBQbO
	KYnrsx4+jusxWvD2MAawZPLqtvH0u4XPy/XD93+r8gZu6H6/cWSBSpL4/Fg+dvvOiWEPh563stq
	DsGdmnNeABNyKGX+8bhM64e7iv2zN/tRhJehfZNzWFq43Upv4axVS2S34l6i3srst8L4WzMxsHa
	nFkW1o0LMminmh3O7QWtz0bzstfmPY48IqeTR5pD+6HryBuE4v1y+D7CylpCe+lMBjLkLeDNlAY
	QELYrVlxmFdp04FPF+GlWoVlx3lO0Y9r9fJee+8L3P3VDKk/83vdtSrCK9/gcsdEG8QI=
X-Received: by 2002:a17:903:1210:b0:2c9:d298:6c06 with SMTP id d9443c01a7336-2cf34a0a6c0mr62046285ad.25.1784360441199;
        Sat, 18 Jul 2026 00:40:41 -0700 (PDT)
Received: from lgs.. ([152.32.188.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346da07csm23399685ad.52.2026.07.18.00.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 00:40:40 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
	Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	Ganesh Sesetti <gseset@codeaurora.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ath12k@lists.infradead.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH v3 0/2] wifi: ath11k/ath12k: release QMI handles on late init failures
Date: Sat, 18 Jul 2026 15:40:24 +0800
Message-ID: <20260718074026.3085688-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_004042_350699_4D1588F5 
X-CRM114-Status: UNSURE (   6.78  )
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

This series fixes QMI handle leaks in the late initialization failure
paths of ath11k and ath12k.

Both drivers initialize the QMI handle before allocating the QMI event
workqueue and registering the service lookup. If either of these later
steps fails, the initialized QMI handle is not released.

Patch 1 fixes the leak in ath11k.

Patch 2 fixes the leak in ath12k and sets ab->qmi.ab only after QMI
service initialization completes successfully.

v3:
  - Split the ath11k and ath12k changes into separate patches, as
    requested by Jeff Johnson.

v2:
  - Set ath12k ab->qmi.ab only after QMI service initialization succeeds,
    as suggested by Baochen Qiang.
  - Fix the same late initialization QMI handle leak in ath11k, as
    suggested by Vasanthakumar Thiagarajan.
  - Drop the Reviewed-by tag due to the code changes.

Guangshuo Li (2):
  wifi: ath11k: release QMI handle on late init failures
  wifi: ath12k: release QMI handle on late init failures

 drivers/net/wireless/ath/ath11k/qmi.c | 10 ++++++++--
 drivers/net/wireless/ath/ath12k/qmi.c | 13 ++++++++++---
 2 files changed, 18 insertions(+), 5 deletions(-)

-- 
2.43.0


