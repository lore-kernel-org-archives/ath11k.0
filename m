Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80CBC44536
	for <ath11k@archiver.kernel.org>; Thu, 23 Jul 2026 01:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:Mime-Version:References:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=PYkSapDs7gVYLipbpFGEaU+VL3bLc5ddWrLrLCEqQZM=; b=1FLYgsFQnt8OA0MtX1IRPC9oIC
	vnK2vmIqelyNRZaHHegaSGXuWteA0DeN+WxU7b5DYUUW0OfFk+Et9oUfZ5rYIQBuX7Quo2p7MegQy
	GJkSfKx6USKgerb//xyhCSreLuFM9M22T0b6bgidM/4NLGqGvzj4dObl6s/B1637MLQ205gq7w8S4
	uOijBl9/Wgsfnz1/QNCL3veIwMbLvcU2p74ofr0d6aCEEJl+Ss5ppUIznJrhrEpQG/PqYUbL9It/W
	8AJ09SBRraxfUGB19guQnA7nFJ2uq9qWC2q73cOB5UV/a0+llsDPYLd/7OU5HGQ7aud+bfDyZvF23
	pBqu6FDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmhzR-0000000D1OP-09iq;
	Thu, 23 Jul 2026 01:12:45 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmhzN-0000000D1NX-2Iht
	for ath11k@lists.infradead.org;
	Thu, 23 Jul 2026 01:12:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1784769132;
	bh=PYkSapDs7gVYLipbpFGEaU+VL3bLc5ddWrLrLCEqQZM=;
	h=Date:From:To:Subject:Mime-Version:Message-ID;
	b=kBxjnbVtCtAoVs3rIDTkzNnvRWNOzmWOYfNz7zpuIjBvHUFOYXPr4quXAFvzzcp8r
	 LYgBfklroIfMCFQ4vvT4YGrot5tDycR2y0g+s0NP6Lq9xNvvHDiJRaR5bbShFtN1EV
	 PBpO9gW/OiaERo+X78LsP8U0cWUUYdhNSYFv8BvQ=
X-QQ-mid: zesmtpsz7t1784769123t6360587c
X-QQ-Originating-IP: yYjmTf2iaKGi23u9FNOyf7hM0f6iS/1kcv6aSjsYu0E=
Received: from PEN002676 ( [1.202.39.170])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 23 Jul 2026 09:12:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 9086336731519733227
Date: Thu, 23 Jul 2026 09:12:02 +0800
From: =?GB2312?B?1dS98MP3?= <zhaojinming@uniontech.com>
To: "Jeff Johnson" <jeff.johnson@oss.qualcomm.com>, 
	baochen.qiang <baochen.qiang@oss.qualcomm.com>, 
	jjohnson <jjohnson@kernel.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, 
	ath11k <ath11k@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] wifi: ath11k: fix resource leak on error in ext IRQ setup
References: <181b5ee0-f002-4f5e-93ff-49b6aa0a6e61@oss.qualcomm.com>, 
	<20260721072128.142668-1-zhaojinming@uniontech.com>, 
	<a85bf89e-5a4d-40f7-9797-66f078427f96@oss.qualcomm.com>
X-Priority: 3
X-GUID: 20D9622D-8241-4E97-B2B7-CE9E7F885D5A
X-Has-Attach: no
X-Mailer: Foxmail 7.2.25.375[cn]
Mime-Version: 1.0
Message-ID: <D1E55E3E9CC1685E+202607230912010225815@uniontech.com>
Content-Type: text/plain;
	charset="GB2312"
Content-Transfer-Encoding: base64
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: NMB3uNxca02mAaaZKl/rhqidUwFfJ1IUMqhj6rrpPrkXrIEwrcYuy3QM
	1CbNLy25vVkSTjf7AOan+Y9y51RSOfFKTk+0PZ7vR0JuBMmCxdYYcGZaKCxe7OyoilK5D4C
	jptNHxfx0vVD+Rym+ad4ee/qIoe37UrKh248Tm3BGx0knSh3ux62YGYQ/FZiD0QMZpnaMXV
	A9Owcud38thOz0WNHAdjQJqCEWK35xZQ0JNHburCYjNaPgagasmLJTNn3RGDbTilQqr8d75
	TyEwyzi2djE1Iywsx11oBuuyW+VUT/kA32Fmwx6MA+qBygC5Tojyj8KCx5srTGBJRtoKeTY
	JUd1igSw1jteAKZIbAE5Dd4qAJn0ZIngvs1Cwt+Yg2DNw4nzzxOR7qRR/ptdoBuopY8fHUZ
	AVFaiYgBScgHDqM0hwrbU6BH91vbaO+d2/JUPK+62yy5qF4vgOEbSI9aREjzVkIM4RavpBq
	//yUAzOsVnGkISsS538CgW81z1ZUA2/6sXXP32AuD5JzYSlY3mnqbAv4vKZLeDefGW2AZcJ
	jjEkfQy/YgJTn2VioKxI2Wkg5dS6qK/U1YOJEjRyHkvMWu0ZMaC+xSBCBx8Gym6+4PyBDSX
	yGnc/WL1xjJuh/tz4ikc+2owTFcX7zU0GurZbKD8nRRRfLgcHUocO/h5YslEx2i1wdxyY+1
	tdEEpg6r94c+hMIfrXBrrSZr82la5uCQMnMlh5IeRoIsBBw37OoNSWvPh0KwRM6HsLZtxGu
	7msgwvmr7r1LQ+E92RcMXxFCdKllO7LzfOy6qAkP3WOS7dGon8ttYnI0l3wjwmAL9s39u+R
	1MTSYvJ+4uN2ggWjl8iF8T7tchImvd4AOYhzeCiTnBSuzf8CSUPrzAFVxFCT17Y9gtuGI7+
	nWecVgzUTUZweCrq1c9jQVVEfAv/PgV1bey7iVbpCbRbYaoQbSFz8gX9QA7hu94HkMYH4iF
	WivuX5ZmEwhRJsc/RlZWrfS5iSWCmg0OSWFqzzjMevAtEm7d+mdg2+Pfg
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_181242_412287_DF45CA34 
X-CRM114-Status: UNSURE (   1.68  )
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

SGmjrAoKSSBzZW50IHRoZSBsYXN0IHY0IHZlcnNvbiBpbiBhIG5ldyB0aHJlYWQuCmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LXdpcmVsZXNzLzIwMjYwNzIyMDk1NDE5LjE0MTEwMDMtMS16
aGFvamlubWluZ0B1bmlvbnRlY2guY29tLyAKClJlZ2FyZHMsClpoYW9KaW5taW5nCgoKCgo+SW4g
dGhlIGZ1dHVyZSBwbGVhc2UgcG9zdCBuZXcgdmVyc2lvbnMgb2YgcGF0Y2hlcyBhcyBhIHNlcGFy
YXRlIHRocmVhZC4KCgoKPgoKCgo+L2plZmYKCgoKPgoKCg==


