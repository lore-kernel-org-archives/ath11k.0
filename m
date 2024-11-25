Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC30D3B7E1
	for <ath11k@archiver.kernel.org>; Mon, 25 Nov 2024 07:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XOth8+4WyEAIRhnvJVmoJchQ0jdnU18Qhw3q4BNCjJE=; b=mEgY3M/DmmOpY9uX0yzaKlzOW7
	mEmo3fudEN0FlquVJauQkNWk5PGFv7MjUUyUhLaIM2oCwvMTGFKtbHJbjNLfFc/lQl6MoUOHcm7ed
	ASkd7YNgUt7gggJ/jfAiRjhwsuFaa10QVhKs7Q2TodrfQyl/vWHcpbrt72FldMzZMSbR7EThC/eib
	ixsC5MM+9laVbteejw5JpLzJb65ZbQTNSGHhUmyobRjLLnAWm/WUcidLd4AZ5BSnQ/WMkBKUawF7v
	eu/Awp+q0rgNgU5/qwTcYSugyANovF3JHAn1ifyODL91ARC2+4DUxTR2iGAqf/k8+kwynNOb4aYPf
	bqf3M+SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFTgf-00000007GME-0hMH;
	Mon, 25 Nov 2024 07:39:13 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFTgc-00000007GLo-2VAl
	for ath11k@lists.infradead.org;
	Mon, 25 Nov 2024 07:39:11 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2ed91d2a245so1654492a91.3
        for <ath11k@lists.infradead.org>; Sun, 24 Nov 2024 23:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732520350; x=1733125150; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOth8+4WyEAIRhnvJVmoJchQ0jdnU18Qhw3q4BNCjJE=;
        b=YLzeSW/vUqDjuDX7FuVptkIuMESAJmZ5ONWYk7L6M6IK3U9eWFSDAfRZoVsh/8Idm3
         CtDQF944bB4oyvsBqWsVbNIBK4aDzsD8nU9m7WlVOX0toFYlYCT/UIFxuG7+zRMuXdXb
         aoy4+V+S0PiLpHa8mGGKOy+al4YpUOrq6dEnAmTdiSlm3FFpVC3YQyWcUPA0aBKtmnnI
         soLnW2V4cXCudbKOf2qacschZ+RkjHhJzQ+9Gm2pCWQ6m6f3Ohx+I5Vw8OdaOlNYsopu
         zkOTjeaCklYk6HYW2U1C7x+qYnyiFH3LS3ar6efkBQFievF3DJCjWu/Ryrl4INoFogaW
         gSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732520350; x=1733125150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XOth8+4WyEAIRhnvJVmoJchQ0jdnU18Qhw3q4BNCjJE=;
        b=UisZ1PBQ7Mg3RS1ydX2gL59GgKm4hVKXUXw3N3AV0kmGKdwjQ9f+iMfkUdULM3ZcwV
         nQwFq13V753MpagbDoxuCJdnhhDxvm1K6mVR9Rhp6gMoqfB3T4593A8N9r2v5LUdUuR4
         HY0iAkCDCg61GOjGbiBsf2aBmpeksDmwohDkjasT6L5nYdaT6of8C3zEhRpdxRRK9/fU
         KrYDRf8IA6gCWtnzYbLlt3/N82+1AA/sunHUPi8SIWcLNwYDhn4sQuL/LBLH6cni/8uU
         Y5iQnSIcbfvTBrix+FHR7sBYmn0nC90T2qxwoF5+wUDz24sNVUJctXzO9Kcm+C7G5LYC
         4upw==
X-Gm-Message-State: AOJu0YxSv/FlR0VU4iiqfO6r2ZXBvi1nXBYN8WdNk8yyS4LUHW+YZhRT
	667cdip37fobQAYGMUYeGKz7D7/pomwcK+ZnLPCqGMdYIiHNHJtMmztOrKzwrKqOzg==
X-Gm-Gg: ASbGncveT8p9SprEB7YzdP4Yls0jQ8ke+a53s4hn5cmb/Wc+kn1q+EqTzMOSiDmY/et
	Qg/YdKo/I8Z2/VNLKyRoqQ+/DKzPjq5fJ+6r9ZhxbtQBAtkON+x5438G2sL2uIYSpJZOcfYIhwP
	g/GapHbJCFbVJBS7UV+T1V1U38ocrCoEUchJG4BRuDa7PKfOgU0IUS774byd3Qc+K9pWGJcmDku
	VzxFtmmybU3qG3hb2vHnVW345hXwUTQ4SqocoOPQfUf0NDNPmRk28dEsSo=
X-Google-Smtp-Source: AGHT+IHmjYkes+pF44fRjMYhwSYJHb2JyZSwKxTk9HfLFfvnCkkRzIlcUUPE9sgQ9q2uTu14Te1INA==
X-Received: by 2002:a17:90a:c10e:b0:2ea:2a8d:dd2a with SMTP id 98e67ed59e1d1-2eb0e86761cmr14344917a91.27.1732520349258;
        Sun, 24 Nov 2024 23:39:09 -0800 (PST)
Received: from LAPTOP-SQ5KB8RN.lan ([222.249.179.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2eb0cfe4673sm6004504a91.1.2024.11.24.23.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 23:39:08 -0800 (PST)
From: Baichuan Qi <zghbqbc@gmail.com>
To: ionic@ionic.de
Cc: ath11k@lists.infradead.org
Subject: Re: Re: [PATCH] wifi: ath11k: Fix NULL pointer check in ath11k_ce_rx_post_pipe()
Date: Mon, 25 Nov 2024 15:37:46 +0800
Message-Id: <20241125073746.260605-1-zghbqbc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ff487372-2200-4100-af8f-108bf2fcb80c@ionic.de>
References: <ff487372-2200-4100-af8f-108bf2fcb80c@ionic.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_233910_635339_3BEA8773 
X-CRM114-Status: UNSURE (   4.64  )
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

thanks for your reply

> !(pipe->dest_ring && pipe->status_ring)
means both pipe->dest_ring and pipe->status_ring must
be NON-NULL , previous code means ONE of these two rings
is NON-NULL.
So when some errors happen , dest_ring is NULL and 
status_ring is NON-NULL ,  the subsequent call to
ath11k_ce_rx_buf_enqueue_pipe() will access the NULL pointer

Baichuan Qi

