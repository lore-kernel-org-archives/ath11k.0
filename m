Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6969C48297
	for <ath11k@archiver.kernel.org>; Fri,  9 Feb 2024 11:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uk7cGinUO6+MfI61MsY5TQbnfLIywEj+F5dM3m4tTkY=; b=PFun6eCSzVTAqx0odv4hqa5W7Q
	BAeaGz+JygEPGXMbp7M3r1EmZ4GzSPMYWk+JPJQ7EGKWGoDBYPpyodbJ+uP+DitijP2arVos5dRAP
	bl9lzBxcsb/83PYbPywhPT1j64tY9vvEl5fYRpIcmpFDlCWGu2y2KWHP5brLnDSpEyaBIi5nDO9Uh
	QImmskh48rKAf1P853t9eUhNBFJiJV239uARuHbVlDNwGqmTCWwldho+zMkEy0Nxi960HVJvcREWb
	kAi/siRLViKT/msHulkkDbXj4lFW+NoFCmWl70MMOaQQvFVgiVTXg06A+8ZCxfWGp3UwBAV6X9fev
	x3kofjYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYPAV-0000000GsQU-2ml7;
	Fri, 09 Feb 2024 11:35:43 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYPAS-0000000GsPH-3E3r
	for ath11k@lists.infradead.org;
	Fri, 09 Feb 2024 11:35:42 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-51167e470f7so1046931e87.2
        for <ath11k@lists.infradead.org>; Fri, 09 Feb 2024 03:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707478537; x=1708083337; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uk7cGinUO6+MfI61MsY5TQbnfLIywEj+F5dM3m4tTkY=;
        b=i4kjbCWRi1fI05K8kDr5JAy5udqWIciM83U0W2f7JP2fpqFBwI155Bhg4/J19k7o/x
         dZze3iyQkt+5nIY07IOoOt0SIm1VGEJ42+RG1Bgp11VLMMKCGEPtgBFp3cLskGJqh7I/
         +4U7ZOTk8/E4lRsDmof6LIddmozOPQquHFYQDGcY8OicGScdHntGBkOFdnz2QpCEZtSF
         AmPcLWxybFWJMCRua4F957WuyLecii5jsrOzZy+vl6IIJ7ZtNRVajK9a7JRrppWvob+c
         r+d7y+53j7Tz88HfN+X3FaZ+nbyShOrosqlZaAS1t2x4PI0fh+jw+1o2pQ2VEHlqZwld
         Ahjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707478537; x=1708083337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uk7cGinUO6+MfI61MsY5TQbnfLIywEj+F5dM3m4tTkY=;
        b=gcOfPGLQ4/Zjiw38xezxnxNEUzu4sa6heuxhCSMuQhdx2UfqmoqJmyGnQnZKCfeJBU
         t/L5V/hNw/7Q2nRO1ZlV37osxWx6lhqJGBlFiFRfWXtU1AM0sET6KL86q3z/Pjd3kHHQ
         kXV8LR75gJTrdmjF7s6VZQrvvhIAFSMOq0XfAAFkzSKKuY8Sboyrdsj5XqMHP/up9G4q
         wfLFJo9ct19LqqUfW6x1LxoIVI0zdxaSB0DtMjjyBltY1+OYpimOFPk6S2XVKnHZedim
         C/o+dW9mKG/Kgl4h6wRt4jI3T/pRovSHe+yRthofUE1F9GoVqLj6UPdq+7FR58wrfC7O
         NxMg==
X-Gm-Message-State: AOJu0YydYiEmtuYbFq0NeHPFBWUCrDi56VD6+8cWkBZEMLoB755U86lO
	HSMlTzUBWdCiosDKNCS9CCfaDt8COR1bHYPv+KXsYS5jH6t6fGi2QD4xwGEy
X-Google-Smtp-Source: AGHT+IESjeCN+0gm1Cygx51rfe4zfSqRMK4u0AGeQhiAmkARA2syogLJyHdfIlwOgqccslSrRrG8tA==
X-Received: by 2002:a19:e048:0:b0:511:7abd:e64c with SMTP id g8-20020a19e048000000b005117abde64cmr620697lfj.23.1707478537207;
        Fri, 09 Feb 2024 03:35:37 -0800 (PST)
Received: from syracuse.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id y18-20020a1c4b12000000b00410723b14e4sm346251wma.19.2024.02.09.03.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 03:35:36 -0800 (PST)
From: Nicolas Escande <nico.escande@gmail.com>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v2 0/2] wifi: ath11k: fix layout of scan_flags in struct scan_req_params
Date: Fri,  9 Feb 2024 12:35:34 +0100
Message-ID: <20240209113536.266822-1-nico.escande@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_033540_827214_C25A57FC 
X-CRM114-Status: GOOD (  11.43  )
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

As previously discussed in [1] we have a mismatch in struct scan_req_params
between the bitfield scan_f_xxx & the scan_flags when used with WMI_SCAN_XXX
values.

To fix the issue & prevent it from happenning again lets stop using & remove
scan_flags altogether in the driver and only use the bitfield instead. That way
even if the bitfield doesn't match the WMI_SCAN_XXX flags, the right value will
still be sent through the wmi command to the firmware (see
ath11k_wmi_copy_scan_event_cntrl_flags).

Questions:
  - In the same rationale shouldn't we remove scan_events from the same struct ?
  - The same goes for ath12k, should I send a seperate patch or respin a v3 with
    similar patches for ath12k ?

[1] https://lore.kernel.org/all/20231127180559.1696041-1-nico.escande@gmail.com/

v2:
  - remove explicit uses of scan_flags with WMI_SCAN_XXX flags
  - remove the underlying union of scan_flags to only leave the bitfield

Nicolas Escande (2):
  wifi: ath11k: Do not directly use scan_flags in struct scan_req_params
  wifi: ath11k: remove scan_flags union from struct scan_req_params

 drivers/net/wireless/ath/ath11k/mac.c |  6 +--
 drivers/net/wireless/ath/ath11k/wmi.c |  2 +-
 drivers/net/wireless/ath/ath11k/wmi.h | 55 ++++++++++++---------------
 3 files changed, 29 insertions(+), 34 deletions(-)

-- 
2.43.0


