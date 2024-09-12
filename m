Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D13EEB56F
	for <ath11k@archiver.kernel.org>; Thu, 12 Sep 2024 09:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GpopKbBFXAHhWa9QLLG1ddO0QWw2hR2VGF0Wh9AlkY4=; b=h5qS0qQe2O+GkeEIofjBOKnhAV
	UqIJUqrKDh/DdsqoY0efgVrEg2sDVII0GY86d7ivcWOocqjrOQMqoN7c/ng0qintBjeR8Z/hQIsXi
	lX1uwd597YlTPp/Xojj8bKOA8wntLErwF+hNLUPp3T7U7WfV2K3jC1pSDG/ZwSaYJQHdXtKHliO9H
	9rmWRVhIxIc0i/6Bp187yzWBqYBqsblmGrGtROnJrcx3eE1HCArz9FXaHyB6kDhBGM3WZ1vGOOUbT
	es29NQO/NCFhJ73Cz8iIMzoML34/uU63TJ7ifCjzXL4sUSjPlPpqm8WLx/myq4yf+becyoQfiylZf
	odGBIJOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sog4W-0000000CW33-0maY;
	Thu, 12 Sep 2024 09:25:04 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sog4T-0000000CW1S-0Di2
	for ath11k@lists.infradead.org;
	Thu, 12 Sep 2024 09:25:02 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5365928acd0so899539e87.2
        for <ath11k@lists.infradead.org>; Thu, 12 Sep 2024 02:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726133099; x=1726737899; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GpopKbBFXAHhWa9QLLG1ddO0QWw2hR2VGF0Wh9AlkY4=;
        b=c+7jYXCyGjmXf5jd0WFSOpgXL21lcWANHPqcD3ioUMV7Q6czHGyDXtAH0pWs87xnO6
         TDVHd1TRCNzrfOoECde8oTV9V8zCqzACT5SCNULk9y4GpLuQdZ06jFLhdgDRQdqCe32A
         x4gU6qX/aCTqX4vmjGqyCN3ISdPqUo28KGVOpOhKrdNyHNcA2xMcUA4yKVCUps0l3+Ht
         9aAomGB0tomlZ7yKIxwSLslZVJEtXlQli5V/5wVs3Ur1VuTNLVLLqzVouhY9NSE5WE3G
         qwtS4vTHF5yL+1BzCB5+4Qphw+RwwNTYRhpwm8bik6acdhfnYdsDvSpTa31CEnWKkiAT
         zZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726133099; x=1726737899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GpopKbBFXAHhWa9QLLG1ddO0QWw2hR2VGF0Wh9AlkY4=;
        b=eT1gxCCvybHzpUZJes37eGcjhXb3nMQ6u2f6zekUIOPeYlpUv+kJWwVUYBeogajL0Q
         7GXsDNNpLp024rSfIMwx5Xo4qLn/YwOXqpRvsQ4DDco6uEGmT+1RNCLzQKGN35wNiM39
         C7A1nfoRw0nsggZ7OPBH0YuZdUTTj7fcxZwI6KXMGN7HL2wAlBuyz/HwQmDzEAvUJRQp
         IjgAnIBN752uiMe2IJfUy7CHNWdI8pLLbPMKm+8sEMVK8YH50aVLS86M8ukPhUdpanEc
         ni2iGmg9O/t99aDOtYLfKTH69oPFrdcx1Ncvaf8hKr2u3H6qF6Ad+t79ECLhVJVdK1iP
         xalA==
X-Gm-Message-State: AOJu0YwntmR5MbddySBY6NGbYgwJ9esWjxDQ7yThBV/EzrychXUnstmA
	r6klN+90YjeduhC0d4oehMzJHJqI/3SC5/EV3+FTSAXQScKmMgi/WmQun1imkMF7H3Q4Q4g7JmX
	j
X-Google-Smtp-Source: AGHT+IG82jMyQ7wL5C8tk96NqAby3fRz9Y6tWyh4WnCQ6s7pnhi/1ZVHnnYOHdN50DZ+iFs8EdxxAQ==
X-Received: by 2002:a05:6512:a87:b0:52c:d626:77aa with SMTP id 2adb3069b0e04-53678ff4d11mr1182482e87.58.1726133097994;
        Thu, 12 Sep 2024 02:24:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f903bfasm1866919e87.206.2024.09.12.02.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 02:24:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [RFC] Qualcomm RB3 Gen2 WiFi firmware pull
Date: Thu, 12 Sep 2024 12:24:57 +0300
Message-Id: <20240912092457.1887906-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_022501_126562_FF06782E 
X-CRM114-Status: GOOD (  15.08  )
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

Hello,

I'm planning to send the following pull request to linux-firmware, adding WiFi
DSP firmware for the RB3 Gen2 board. However before doing that I wanted to
check if it's fine with all affected maintainers.

Qualcomm RB3 Gen2 board resets if it's used with the existing WCN6750 firmware,
most likely because of the differences in the TZ setup. This pull request adds
firmware specific to the qcm6490 / qcs6490 SoC family.


@Kalle, I understand that you cannot and won't fully support this firmware set.
As a preparation to adding these files I moved existing files to the sc7280/
subdir and pil-squashed them.  It is a generic preference to use a single MBN
file instead of MDT + Bnn files. The mdt_loader detects the format without
using the extension, handles the differences internally and doesn't require any
changes to the driver or to the DT.  Could you please ack such a change?


@Bjorn, @Konrad in the past we have pushed all WPSS / WiFi firmware to ath10k
and ath11k even if gets executed on the host.  I should have caught this while
reviewing DT changes.  This branch uses firmware name that isn't compatible
with the existing DT files.  Would you insist on adding compatibility symlink
or we'd better fix the DT files?

---

The following changes since commit 4a0367b33aeaa7fe1255a920d0e39f825b6985c1:

  Merge branch 'rtl8852b' into 'main' (2024-09-11 11:00:41 +0000)

are available in the Git repository at:

  https://gitlab.com/lumag/linux-firmware rb3gen2-wpss

for you to fetch changes up to fb8c67987c89b6f33fb787dfc6ff6e5e0f317f6d:

  ath11k: add device-specific firmware for QCM6490 boards (2024-09-12 11:58:57 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (2):
      ath11k: move WCN6750 firmware to the device-specific subdir
      ath11k: add device-specific firmware for QCM6490 boards

 WHENCE                                             |  18 ++++++++----------
 ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn              | Bin 0 -> 7734064 bytes
 ath11k/WCN6750/hw1.0/{wpss.b04 => sc7280/wpss.mbn} | Bin 5819999 -> 7463728 bytes
 ath11k/WCN6750/hw1.0/wpss.b00                      | Bin 340 -> 0 bytes
 ath11k/WCN6750/hw1.0/wpss.b01                      | Bin 6848 -> 0 bytes
 ath11k/WCN6750/hw1.0/wpss.b02                      | Bin 10300 -> 0 bytes
 ath11k/WCN6750/hw1.0/wpss.b03                      | Bin 4096 -> 0 bytes
 ath11k/WCN6750/hw1.0/wpss.b05                      | Bin 164332 -> 0 bytes
 ath11k/WCN6750/hw1.0/wpss.b06                      | Bin 266684 -> 0 bytes
 ath11k/WCN6750/hw1.0/wpss.b07                      | Bin 1176368 -> 0 bytes
 ath11k/WCN6750/hw1.0/wpss.b08                      |   0
 ath11k/WCN6750/hw1.0/wpss.mdt                      | Bin 7188 -> 0 bytes
 12 files changed, 8 insertions(+), 10 deletions(-)
 create mode 100644 ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn
 rename ath11k/WCN6750/hw1.0/{wpss.b04 => sc7280/wpss.mbn} (77%)
 delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b00
 delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b01
 delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b02
 delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b03
 delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b05
 delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b06
 delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b07
 delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b08
 delete mode 100644 ath11k/WCN6750/hw1.0/wpss.mdt

