Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1158EC25B76
	for <ath11k@archiver.kernel.org>; Wed,  5 Jun 2024 12:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G+Nvyhb30jMRTp5MAcBR0DPyo3QQwWDlaTstXDQ5DSE=; b=O7fZU+0KUei/aba7NDKrUFYYYt
	sYHtdKboJ6Skbg3wyUZKtnjYe3x0o2T3sdLm/5d64J1GVLmnPKEwAATDJvdtBwW5lvEz+LU3Z8kLp
	VNNCoSJzLv6OG5QVoDHaaSWyp6YuYHLuTEzsQcArrnwh/icwpcD18yJg5e7quW8IuMOUIMI3bXKTR
	6+w+Hel7EjcjN6MBxNIWjdp7XLqRc9uE+ghSOGHRaXbm4QM8eOlluCKIVuhJF2M2dqbyDuhFW57Az
	P0ueS93CiFYcI2yzrRb9HPsnQ5MCRM1UCBMfbVuM7RP2Wrq7qj8d6aa4jmJpRc/sAX8D+XnVq9t76
	L7wsa6tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEpdy-00000005xb7-2kN2;
	Wed, 05 Jun 2024 12:21:30 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEpdv-00000005xVF-2ask
	for ath11k@lists.infradead.org;
	Wed, 05 Jun 2024 12:21:29 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2e73359b979so67102411fa.1
        for <ath11k@lists.infradead.org>; Wed, 05 Jun 2024 05:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717590076; x=1718194876; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G+Nvyhb30jMRTp5MAcBR0DPyo3QQwWDlaTstXDQ5DSE=;
        b=RChSFh8wuxJjTeRhtzsnPB/gwRnsee1C/eY9AGBMdTaroI3GHZlx1+nACdlg1YbyXd
         C1d/d/N/fJq1tVhjs5HFBYNGj1dAF6A9OrtQIgQqQ6kJGpXuADgCw3rSF6owxRt2uM2M
         +pqNpV5hXjNe1SAsgCfXCiTNe+P7PycT5T1YBGE0wgFXQ3CKq9iDcwwQYoDXveN/pNcd
         qz7SfTd1q1dTvjst5iSQoa2JZbv/AQBdqY5vzYeFhOhEw5gENFrn/ivqRHo3RGHqlny3
         CVDiBHJqvEkn6P9wF5uDA6HdPdAUocsP07OLjQSLVcawiTCLKZ7GFt8w2C09IQNxIfsW
         j3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717590076; x=1718194876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+Nvyhb30jMRTp5MAcBR0DPyo3QQwWDlaTstXDQ5DSE=;
        b=rz9CBcssawZ3nZPKA7LQAywmsK7RpY6qqt3rl+KdOdBr2LUN2an5ySLpAWxZKJn/26
         742FlE5rbDujledrK1EoGKpd1qdp3mnxSf5eFbREmujxi5Nd6pJKC2WqRuzFMP8/o/um
         iQy/SzhxN2hxcofNOfpMw1pdol3gfjUWBpVqE+GUyDMy3DAWrEEMm6yya26ag65pGJEf
         EZbiIwRYkngeZVxQnLtTHuj/lrlNNeVt536446+x7OSW+kE4XDtQmlfzcEgCeKaAjLXu
         xhoeghzb6gAX7dNlw4MaM01ynDkNeTXm/c2PItbAQFguRjtBkZAq10hez2MBIeybV/YE
         46Pg==
X-Forwarded-Encrypted: i=1; AJvYcCVRJ1G4Rbtfa6gnG6A/6x8oeRAlfoVpGCRaDBYeI+M7vpxaik0aQSUzh6zVDhmXUlSwMhEXWf1/IolzVJvpmlzp3PfAt43l8sLDCA==
X-Gm-Message-State: AOJu0Yy5V+ijYKln3vj0waaeSQE1wQhbe7XOYqr4+VDemSu0Ykzs1/r4
	m2QCSK55OWtS5+WNqX9Tc0yc34r/YUz9+oS3qT+gf9UYseldxoiebMKfoQcydyw=
X-Google-Smtp-Source: AGHT+IE21RURyt0kYC+Jz489gsL7lhhTmR21aXYTlyuWI/0yvyEIMAOFWs8jF25IHJtn2FVRLjKUsQ==
X-Received: by 2002:a2e:7c0b:0:b0:2ea:772a:ddb4 with SMTP id 38308e7fff4ca-2eac7a526f0mr14280681fa.34.1717590075844;
        Wed, 05 Jun 2024 05:21:15 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:d3dd:423:e1eb:d88b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215813ce64sm19634485e9.44.2024.06.05.05.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 05:21:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kalle Valo <kvalo@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ath12k@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v9 0/2] dt-bindings: describe the ath1X modules on QCom BT/WLAN chipsets
Date: Wed,  5 Jun 2024 14:21:03 +0200
Message-ID: <20240605122106.23818-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_052127_706051_6B1FEDA8 
X-CRM114-Status: GOOD (  14.34  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Here are the two dt-binding patches from the power-sequencing series
targeting the wireless subsystem. To keep the cover-letter short, I
won't repeat all the details, they can be found in the cover-letter for
v8. Please consider picking them up into your tree, they were reviewed
by Krzysztof earlier.

Changelog:

Since v8:
- split out the wireless bindings into their own series
- Link to v8: https://lore.kernel.org/r/20240528-pwrseq-v8-0-d354d52b763c@linaro.org

Since v7:
- added DTS changes for sm8650-hdk
- added circular dependency detection for pwrseq units
- fixed a KASAN reported use-after-free error in remove path
- improve Kconfig descriptions
- fix typos in bindings and Kconfig
- fixed issues reported by smatch
- fix the unbind path in PCI pwrctl
- lots of minor improvements to the pwrseq core

Since v6:
- kernel doc fixes
- drop myself from the DT bindings maintainers list for ath12k
- wait until the PCI bridge device is fully added before creating the
  PCI pwrctl platform devices for its sub-nodes, otherwise we may see
  sysfs and procfs attribute failures (due to duplication, we're
  basically trying to probe the same device twice at the same time)
- I kept the regulators for QCA6390's ath11k as required as they only
  apply to this specific Qualcomm package

Since v5:
- unify the approach to modelling the WCN WLAN/BT chips by always exposing
  the PMU node on the device tree and making the WLAN and BT nodes become
  consumers of its power outputs; this includes a major rework of the DT
  sources, bindings and driver code; there's no more a separate PCI
  pwrctl driver for WCN7850, instead its power-up sequence was moved
  into the pwrseq driver common for all WCN chips
- don't set load_uA from new regulator consumers
- fix reported kerneldoc issues
- drop voltage ranges for PMU outputs from DT
- many minor tweaks and reworks

v1: Original RFC:

https://lore.kernel.org/lkml/20240104130123.37115-1-brgl@bgdev.pl/T/

v2: First real patch series (should have been PATCH v2) adding what I
    referred to back then as PCI power sequencing:

https://lore.kernel.org/linux-arm-kernel/2024021413-grumbling-unlivable-c145@gregkh/T/

v3: RFC for the DT representation of the PMU supplying the WLAN and BT
    modules inside the QCA6391 package (was largely separate from the
    series but probably should have been called PATCH or RFC v3):

https://lore.kernel.org/all/CAMRc=Mc+GNoi57eTQg71DXkQKjdaoAmCpB=h2ndEpGnmdhVV-Q@mail.gmail.com/T/

v4: Second attempt at the full series with changed scope (introduction of
    the pwrseq subsystem, should have been RFC v4)

https://lore.kernel.org/lkml/20240201155532.49707-1-brgl@bgdev.pl/T/

v5: Two different ways of handling QCA6390 and WCN7850:

https://lore.kernel.org/lkml/20240216203215.40870-1-brgl@bgdev.pl/

Bartosz Golaszewski (2):
  dt-bindings: net: wireless: qcom,ath11k: describe the ath11k on
    QCA6390
  dt-bindings: net: wireless: describe the ath12k PCI module

 .../net/wireless/qcom,ath11k-pci.yaml         | 46 +++++++++
 .../bindings/net/wireless/qcom,ath12k.yaml    | 99 +++++++++++++++++++
 2 files changed, 145 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml

-- 
2.40.1


