Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96974C4345F
	for <ath11k@archiver.kernel.org>; Wed,  1 May 2024 04:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nP0d9ZPQBQsFSlVx/oy1BB3GWNuBWXEjTH9+lDRSSeE=; b=zFKQ9SKpCU0VoAL7zTomdFplGB
	MLrjtmh0q3LYowSa8uPlQXOhh6j1L17hhEbm3xngYqt511luF7M5SRTP3fJWBKSIpsMbjPIQRkPuA
	WwCCN6TuTarz5rPqv5bmwlxuMXtrqcmWHnCEBL95Mk2juI6itv3p/qN3UiEjnA5xst6J5Cw2wP13G
	E5UcK9yUjVwTigqDGjEMz7Ex+/iIi6nWo6jlMwqEffFZhyvctqfYMmw/5en4i61Pm+dkgrqU0NOnr
	NFWcvDaLfS+FbGkJvTneLM3OhoF5lTKFSbO7JScJFrQ4gHhAh+ao7dw8u8Jya2Vrrzqq21sca2jka
	XC4TmK3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s21gS-00000008YSm-2Qa5;
	Wed, 01 May 2024 04:35:08 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s21gH-00000008YRM-0xGi
	for ath11k@lists.infradead.org;
	Wed, 01 May 2024 04:35:07 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5f807d941c4so5063740a12.0
        for <ath11k@lists.infradead.org>; Tue, 30 Apr 2024 21:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714538095; x=1715142895; darn=lists.infradead.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nP0d9ZPQBQsFSlVx/oy1BB3GWNuBWXEjTH9+lDRSSeE=;
        b=yjXGRwEgLBaFIawVJp014VrZO7OBDDTHNnnYGePMbws/3mo56GIFAm5V38lSVrNcW0
         LjYctaDS2fiPZxTlxWhEtthdkr5MA7xNTQhOrGYk6I2UZ0Q5FQXrz0TEShRWcGLYNAkF
         CWtgYxPqNDycVbLHUVBP5zJPLa9f4BRIUzgqheyJ3edAvauaZh7QwQxe452ubYCf+TLj
         AVt4HfPb+RPyrBD6nAAPSGe4ARDfaWWbuqkJgYE1TTMhxTPmWxZ71S6DIVPz6xFJyeDR
         Kni55ZbwCa11ZIZuZaPkdAUl/2l6rlnvop0F6AeAhJcSxa6hQGsUlLHJnSRWUbmEBTzz
         lxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714538095; x=1715142895;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nP0d9ZPQBQsFSlVx/oy1BB3GWNuBWXEjTH9+lDRSSeE=;
        b=iKtdodxt6culpz83OLDJAStn8pG1BbwIp1V9ZEilgw5fUdU83+qoXmC4HWTOCCyJKD
         7cX42WzPJ0wBuhzv5wkdWAZJ6lxD+lLCErZZmCgikRvqbQayjtAAUHFfVOX6kuPjcfqk
         Be04QgDEuwagpnGRVmLeop0GazDQCIK3Usa3cHfcvQ7T50h3mkVp9MjzoSdidMHNieX8
         K2D8oVrPvIQoDrhDUGbbLAMzXwyi0mUZzi7WvafB5QqcaVKkWMWKVbk+8T5DzO1lXAg1
         D9Otsmr1mmN8/iQb2vKYXCdpWZTmYUHwPO7yXzYFfH97NukV2TdZC2uUpx7U+ql3AL3X
         zB4A==
X-Forwarded-Encrypted: i=1; AJvYcCVGcQZav9fK2ywyZgKkvnHLoIANUNmyZ8qYTS4F9AU9ByuV7LDD80bIcqYuzmDa/5KZsDkk7YiUWgItAPqimyateiKZlY2Gz4miDw==
X-Gm-Message-State: AOJu0YyAKamnjC5bzPaihbbYkA/JzADXEjfWXsnx2zCUs1G00+Dx7g4t
	sOaBPwuDFsGh0mZZyp/6bsBnXh4O7or7qUDR6MTqZ6eGfJ0DzN+tFvzF4ie99R6bDblDRgB74Q4
	=
X-Google-Smtp-Source: AGHT+IFIWjgfOTINbS43h+bnyH5Hd0IRYKA3jbzKN8xbSIfBpy3Z/8d64GAs6wucSVbhak2mJn+3yg==
X-Received: by 2002:a05:6a20:a12a:b0:1a7:2e17:efd3 with SMTP id q42-20020a056a20a12a00b001a72e17efd3mr2413924pzk.5.1714538095242;
        Tue, 30 Apr 2024 21:34:55 -0700 (PDT)
Received: from thinkpad ([220.158.156.193])
        by smtp.gmail.com with ESMTPSA id ha24-20020a17090af3d800b002b1b1a3611dsm474389pjb.43.2024.04.30.21.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 21:34:54 -0700 (PDT)
Date: Wed, 1 May 2024 10:04:50 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: gregkh@linuxfoundation.org
Cc: mhi@lists.linux.dev, quic_bqiang@quicinc.com,
	ath11k@lists.infradead.org, quic_qianyu@quicinc.com
Subject: [GIT PULL] MHI changes for v6.10
Message-ID: <20240501043450.GA5218@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_213503_711569_D600B89C 
X-CRM114-Status: GOOD (  11.91  )
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

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-6.10

for you to fetch changes up to 48f98496b1de132f2e056605b5330209136066dc:

  bus: mhi: host: pci_generic: Add generic edl_trigger to allow devices to enter EDL mode (2024-04-25 20:25:45 +0530)

----------------------------------------------------------------
MHI Host
========

- Added a new API mhi_power_down_keep_dev() to not destroy the struct dev
  associated with the MHI channels during MHI power down. This is useful in
  scenarios such as system suspend/hibernation where the probability of
  channels coming back is very high. So the PM maintainer suggested not to
  destroy the struct dev in those cases.

  This API is introduced for fixing the failure reported in the ath11k driver
  during resume from system suspend.

  NOTE: Due to the API dependency, the patch adding the API is pushed to an
  immutable branch (mhi-immutable) and merged into both mhi and ath trees. But
  the merge commit is not visible in mhi tree due to git being smart with
  'fast-forward'.

- Added an optional sysfs entry to force the MHI devices to enter the Emergency
  Download (EDL) mode to download the firmware from host.

- Added EDL mode support for Qcom SDX75/65/55 modems as per the MHI spec v1.2,
  Chapter 13.2. This involves writing a cookie to the EDL doorbell registers and
  then triggering the device reset from host.

----------------------------------------------------------------
Baochen Qiang (1):
      bus: mhi: host: Add mhi_power_down_keep_dev() API to support system suspend/hibernation

Qiang Yu (3):
      bus: mhi: host: Add sysfs entry to force device to enter EDL
      bus: mhi: host: Add a new API for getting channel doorbell offset
      bus: mhi: host: pci_generic: Add generic edl_trigger to allow devices to enter EDL mode

 Documentation/ABI/stable/sysfs-bus-mhi | 13 +++++++++++++
 drivers/bus/mhi/host/init.c            | 41 ++++++++++++++++++++++++++++++++++++-----
 drivers/bus/mhi/host/internal.h        |  4 +++-
 drivers/bus/mhi/host/main.c            | 16 ++++++++++++++++
 drivers/bus/mhi/host/pci_generic.c     | 45 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/bus/mhi/host/pm.c              | 42 ++++++++++++++++++++++++++++++++++++------
 include/linux/mhi.h                    | 29 ++++++++++++++++++++++++++++-
 7 files changed, 177 insertions(+), 13 deletions(-)

-- 
மணிவண்ணன் சதாசிவம்

