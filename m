Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B24F606A327
	for <ath11k@archiver.kernel.org>; Sat, 14 Nov 2026 17:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lICZDCS9;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=uiftQzpq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OE0WjxLLrE3A9lY9DuO2yvYGktTA/H5dP7T78Fl8WrQ=; b=lICZDCS9WHzw0D
	h7kIxTFLSAMXtHyRGF+QeGkBBBHMusTY8oqOa8LjkpF0hoRdSLaY0lAK2cCsInG0GlxsBwj3mtC0c
	sRvCC+6GVEv+1GBfY6qIdCrprItU4xYifdBa5QjFJUbjVE49HQeEKfJaRND6GzWnkKmHbHp/OlkHD
	a2cbVRcTdUEJt+s6OMNshej/lcAfYha/5AqnNX3Pn0K+8Rug+0VZ66jiAax/+lVQYOqNaNTTdz6o7
	1M5Rk4vQrodsa75FqKTU5L2STpuXHVnvI+4TWUORhFsLA+W2eKbXRWNgYvOhUAwmh/zEJ1WvM4kTx
	qweG1/f7uICevmBUijzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSHR1-0000000GW61-41Ag;
	Sat, 14 Nov 2026 17:21:04 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSHQz-0000000GW5I-2IBj
	for ath11k@lists.infradead.org;
	Sat, 14 Nov 2026 17:21:02 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6b7a488a0a4so2511732a12.0
        for <ath11k@lists.infradead.org>; Sat, 14 Nov 2026 09:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794676859; x=1795281659; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OE0WjxLLrE3A9lY9DuO2yvYGktTA/H5dP7T78Fl8WrQ=;
        b=uiftQzpq3ay/OkPDJ5ik/VS03ZAXZnnV73iRbDKJsnr//25jthpl9O0vK08FkKPHHh
         LGqQlwZaXQ17vhfkdqQtolfQSsdgXRtDiPBTeQD7jvD5fB9zxcc3FG2PuDqkio334ooG
         4w/j/TmDyitGpZUOjGOHalW5viR+Io0HsHs04udDeS3NZe9M8o+QT8j2wd7O0oQiRbD0
         iFLqy5hBJ4wI8XQxCg6DGgudvQI7koD7rEGjsefmYbf79tiFDJKn3MVlJHk5zC0Mwgxs
         qwLC6twD6HaA+LpPdqmoE4IoOVrJOzbg1q1geeaxTDbL8ZQITZ4hNlobEoWyMqdp5XZP
         1VDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794676859; x=1795281659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OE0WjxLLrE3A9lY9DuO2yvYGktTA/H5dP7T78Fl8WrQ=;
        b=gDzBOra6JwfwVln2OTdLeLs2dRZBhMAazdwDhWWfWGFGAKDg5JvL39yWsvBG1aJL6q
         BMl1q93XLdK6FqHDUdVTY5T7ICXqdQSLpanFTwabEQyTgH6LnbFUFIORtl2s1DyJRQvO
         ZIAQ9OMcETbfJTEDa5kzykKeJQIlxgrdTz1yFXiS8++/kqLB6NEh2cez5JEvb/WCXoJV
         i/E5XDZ8Po7L02myWgA3qQUcnwbUbNG2vak9/LzNoE4+glSbMrVJcqkXL8rgj7RM5CDN
         T7pnyNO+MR5b4pFuKizusA1ZlWPtzif2/I+chXd5B7lMwC9coJ6nrx/LpScBWcy9UeUU
         SmVw==
X-Forwarded-Encrypted: i=1; AL+hErGrQqu90h3POBSX7ttLQozTimvV3M59FMtlF0j4N8Dw8YWpwYomlgX+J4DYIcxpv0WfF/F79bg=@lists.infradead.org
X-Gm-Message-State: APuU4Z/k9gcPhbRGkGER6N/RRZ+zaXjxDF9Zo2OSXEIlxtt7YXxz1LWi
	pWdPUSB2R3hlM3+7z4fyubhRTeZUDj5ijQDu9ZTKIYAt3Z73n2U87Vkdt/gtcgyes4sp27QwSGh
	ZwF8HHZ04
X-Gm-Gg: AYBFou1oZxdyjb9ya1pkX6Gcdcs8vtNbI9UyziKi9YsWPTC34s91gtiGc/sByhv60Kp
	tKMdDmC4+yFT91bx6ccsjrqlwjT6wBdowTkbUwDq3xA3ZRxawDAEtWcf1UZBRRji3eeOwi7HRBp
	kmObx3rq6deHFm/Hl+LlROsUd9pADvzltx8IYrzRpcg2yu4ol6RicixOew3cS+jccOtOfESZxLV
	/91KoF25sYxHyd82bITq4JX87N/FlRu11Nvm0zcIeTV0T3XCh3fNAX0AqCVTUTLZkORT79uwwJJ
	SXTtwvhDE7M6NaZXmIcvr35T1XrlvML/c/lkoYfHl8pfKLd623zX2n1S4xb9slyoxzJ00yvTZ03
	SaulbJWD54L+8NxkQWslAmWUZrwWW1TOkSNCb9GxVcwdadNmb3fhdYJAATBwlYWiZQCkXtjNleH
	MiDEcz4dW0DeWUSsgvrO4UMCx7uTbjt3AwTIHjl9uNsgcouMyhLJyhkWD70LlcqmyHen02jhy/r
	WFSxLL/+JuGG0YiRZOTU7zn+HVHGdMcNtF7xdroWqnC8ZH9/qS8upu7xzh7HY2wUhKhiWlsM6GL
	iEO9k1/MDmSFJEpAxflEZPFGOYERUutWD19EcJobFtuDcNDGUZwkCrpXU1BkSCe+4wOH3PHKPXN
	iCbapl0Z1OUAezUEEQ5xDkvAzvS9wSqiMG6PJiv/6xLrPgqNQtyR4EK4jHdHvZZOyDbk1gAZWXV
	tAZmbMOQwu6KTcOm5ic7RU2WPNNswcgkkTaE+LPW0VwHBVzhhE0fx0af0YZmjuPMqo7bWcLDBOY
	adnV8z8GOUKQR5zgGjKYBnz4AeUi+dktu9dow1w4MgHX/4TdbH7gPxsfqbVcC7UIrHzP9lSpCQe
	+Kxz
X-Received: by 2002:a05:6402:320a:b0:6b5:6546:f7f2 with SMTP id 4fb4d7f45d1cf-6b7c0d144demr4458124a12.37.1794676859188;
        Sat, 14 Nov 2026 09:20:59 -0800 (PST)
Received: from Desktop.fritz.box ([185.181.130.189])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c21b1a08sm2462848a12.5.2026.11.14.09.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:20:58 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jeff.johnson@oss.qualcomm.com
Cc: jjohnson@kernel.org,
	baochen.qiang@oss.qualcomm.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	manikanta.pubbisetty@oss.qualcomm.com,
	kvalo@kernel.org,
	sriram.ramachandran@oss.qualcomm.com,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH ath-next 0/2] wifi: ath11k/ath12k: drop TKIP frames too short for the Michael MIC
Date: Sat, 14 Nov 2026 18:20:56 +0100
Message-ID: <20261114172056.678298-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <002f7e3f-e4e5-4c7b-b683-c2add5b6377c@oss.qualcomm.com>
References: <20261111080620.244164-1-julius@bairaktaris.de> <002f7e3f-e4e5-4c7b-b683-c2add5b6377c@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_092101_585882_DEB1BFFC 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 12 Nov 2026 10:40:50 -0800, Jeff Johnson wrote:
> Is this a theoretical change or are you able to have firmware pass too short
> frames to the host?

Not shown on hardware yet. The overflow is in the host code and a
harness that runs the driver's MIC path under ASan hits it, but whether
the firmware hands such a fragment pair to the host is the open part.

I'll measure it on an IPQ8074 with ath11k. That needs a USB adapter
that can inject raw TKIP fragments, which I'm buying now. I'll reply
with the capture and dmesg either way; if the firmware drops the frame
before the host sees it, I'll withdraw the series.

Julius

