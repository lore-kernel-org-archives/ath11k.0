Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203EECCF2DA
	for <ath11k@archiver.kernel.org>; Mon, 19 Oct 2026 09:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Pz3/gqrTV/SKKDEFpGlc+W7jSRg3mmfHystnBQbO8w=; b=cR2sooFZl+NzZf1oYdSUG6E8nU
	noF1TCVAvGbgYcAD+G9RzHBN9zAqkrG5j3stpOsS7j6siSOnqdjxNF86VRXKBTTEizM4S5jNWdcNf
	c85CoOIeCZAO4MIBPtoQYuvFQvv9xn2d8DsXY8C/3XZy8GoIj/61o9X2DRPG/T+TDwniPy+G9O+k1
	f43RWoDe618IX4+l/YiaOZENR5n6GY1OQKflrjTO4gjrlF6wKPC2sWfIhR4g7JLcGes8XUmFC3pPl
	6aQJ8DDZM20Os/9Dda7a1wQmthlApNV/D/vJko7GEB/BxTbI6uGOEYVlSyQ2AkYUariKXKlT+5DOu
	kfnaNFTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjsx-000000072Ix-3FB8;
	Mon, 19 Oct 2026 09:42:27 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjsu-000000072I7-2U6l
	for ath11k@lists.infradead.org;
	Mon, 19 Oct 2026 09:42:26 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c445c95d553so72574666b.1
        for <ath11k@lists.infradead.org>; Mon, 19 Oct 2026 02:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792402942; x=1793007742; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Pz3/gqrTV/SKKDEFpGlc+W7jSRg3mmfHystnBQbO8w=;
        b=tFYuXJi3iEBxZmT89dhU3CWBNG3QgdkDbvg0xvtFN13vUJJIzukFTDwVndkH0YS3XT
         OJvkL6xowD38AbPM3t83ypmV+0459EPRLRQLof4JLLHuAidClj5u9IS72vnl+FtF81EN
         j9I2PbrtqoK3ioaJ2C6fN+/OrDmjUleJsa3oV2GS0vaiuESMWJJJnoB41JjqnnuhXiA1
         zL39pWUFBLg/qeu579EdIlI0ZXVLn63qDXKuZDH0LM3ZHGbK5xyZgaWlkknsX9pwP7qn
         PhCzZCBvUwVLyaJifIw0r12Z5Pyk5yy2mOM2CGcPL+yMzDrRB+J7u4rpA6lRRisJ8Cz6
         4+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792402942; x=1793007742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Pz3/gqrTV/SKKDEFpGlc+W7jSRg3mmfHystnBQbO8w=;
        b=KBtDlP4KWupiJEQPZCpR0hfVZUJPwgS8MVmD7Us/iwfXPb/QXtz9nWeBAtkvm5pqt3
         oP9Fa2eeZANJxHRR2Fi0JVoqMpQekNzkdVFBrnl2kIwADB7XkweV+eLQqaRd976ExBFR
         E2nxPYV/E0CifSFy4jVKq0xkQDChMJRG7MOLWOMCozm6iiWB7C7j0dmrA4rpBTVpuUmU
         qIiTOBBtuZ4iBXuW918gaEfCcjjmpNXsN2bRt29PLDtIywvMTlOwFcAgYUXRTYvRbTGw
         KgTj3e4RMvAX9j4UOar7b4XtnsNWEyCLnyCbqXT4PY21P/X3xmyEYl7S8NG/waEpdqBK
         4How==
X-Forwarded-Encrypted: i=1; AKwUvByXIR2FmoZPW8J4H70pV6lsc3LZP5uFcg1ImtoF0JMtirO0Hqr9/W9Ec8dRpUbGUbISwZPwIU4=@lists.infradead.org
X-Gm-Message-State: AFq9FYIUXz+JacsTk3SfoBkhD7r96qGtfT9LKEJuB/aDT/L0fTHrC6M2
	g5wZNZLzRMIDdVp6AD5XrXDQhMxSYogySAvZIKczf30E2Azfk25KjORm5wWZvuj/5Q==
X-Gm-Gg: AYBFou1p5rTWfrurlIGhlnoXmcQLa6DI7yE8wB+EO5des/rgcXpcRatuQlFTPqH/5UA
	rrNT/LEYfe9/QB387I6MwlBGwFtjdcNmTPoIJ6fTvgDj+Mb9QkgWV3bkYMh3FH9QA632BCNcJQR
	2OUxG/s7IGABk7RGTlWIquFROlLklCS4/x3/VFABN4035f6M7DoStzb/GrPI0aEU7r/OhsbTupE
	QQfIrXhs4bTGQ8RqogsyAO1BzObU49YFXTL+/6OZhBfHLbyN+jj/VZ4/hA5cQP7OA/V4JH2KvoD
	VlKDjihBXSvFnISZSlhdm/MVV93NpNCvE34SxDx36Cdaka9AEqgopI4LhViYjWBvF9ygW0hnU3X
	OMVxTlJKD5mqp/rA3UAnWUEDsC3aF+HfGoOQ0FGXTEfXFJqk6qhxTRD2oDKPtyRv9ruEt/mkDXQ
	uzecY11UZYBjR/wEOG/BF8X+nGlrhtTTpD+FMUDKMie+0H7n4nsirHGvceyHrDisNWCngdCv403
	ArVnsm3GZDfXrE1kl/e1v4qKqz/JBLfy9YW2JUb/3uThlxbOgf96CLIJfMu6UGSzpqyOYs7xMAh
	0kfoa5lH/gCXuzgncolHp+y3I5tcURPKcN5mn9frBnXypnTyN37j/9WCwBmyBSXK4VhjsB7pW7s
	zhxE/CS7l24/8TEwzRDcqNyjujV27TyZvrtrs2EhMs2XQK3Iu03F3vUvF3wJrqfHF2wBws9M4IR
	xwrTIU7A==
X-Received: by 2002:a17:907:c819:b0:c41:79f3:72e7 with SMTP id a640c23a62f3a-c419d93b484mr450863866b.18.1792402942396;
        Mon, 19 Oct 2026 02:42:22 -0700 (PDT)
Received: from Desktop.fritz.box ([207.22.61.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dd124csm348169966b.28.2026.10.19.02.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:42:21 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tamizh.raja@oss.qualcomm.com,
	jtornosm@redhat.com,
	baochen.qiang@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	sriram.ramachandran@oss.qualcomm.com,
	yaojiale02@163.com,
	quic_pradeepc@quicinc.com,
	kvalo@kernel.org,
	sven@narfation.org,
	john@phrozen.org,
	toke@toke.dk
Subject: Re: [PATCH ath-next v5 0/9] wifi: ath11k: airtime queue limits, airtime fairness and a driver TXQ scheduler
Date: Mon, 19 Oct 2026 11:42:20 +0200
Message-ID: <20261019094221.208526-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018174904.1757161-1-julius@bairaktaris.de>
References: <20261018174904.1757161-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_024224_660038_16245213 
X-CRM114-Status: UNSURE (   6.02  )
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

The v4 and v5 covers were measured on different days and bases, so their
numbers do not compare. Both versions on one image (OpenWrt main,
backports 7.2), only ath11k.ko swapped, v4 as posted and v5 on the TX
flow control v7 patches 1-3. One 1x1 VHT80 station on the radio, TCP
download from a wired host, 20 s, three interleaved runs per arm, sender
RTT mean in ms:

                          unpatched       v4              v5
  default, auto rate      237, 242, 242   154, 180, 150   134, 178, 153
  default, VHT MCS 0      530, 536, 541    43,  40,  45    40,  43,  42
  BE 500/1000, auto rate  220, 245, 237    29,  30,  36    32,  37,  51

Every auto rate run carries 92.7 to 95.3 Mbit/s, every MCS 0 run 22.2
to 22.6 Mbit/s. On this base v4 does not reach its own cover numbers
either.

The 62 to 68 ms in the patch 6 table were measured before patch 6 also
pushed the access category of firmware-released frames; the posted
series reads as above.

Julius

