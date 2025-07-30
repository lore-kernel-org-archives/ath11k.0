Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05721C87FCE
	for <ath11k@archiver.kernel.org>; Wed, 30 Jul 2025 07:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6l1gAO/UvA1KSMRC0e4WN8jJW7JgF3A+xKhsibHchD0=; b=4PpMzKiqaEFi7uEoo2nNeRE/G4
	DhElvsTEJndlJFwtLrflttQLWu918fCTfo4KiUGUlnEnr2wuA9rJi0I7ThmH63IuS/G8fVjgHw+3Y
	G5+5RzcZdXAkha+zudHjwZiIb3eUvgmLJcFPglyoW37CF0R12Zkd0LJLorcGrhHk3EDR9sHPL4/um
	ykNhibHQbPMApKN1jG+gDcpRFQWqnFYdN2XVip9ksS1w9h28qBjdm46BV2QJGohY6mz1/IPxlIU4G
	LbjDb4B2zNFnQB/IbHN3azOH6Fpe5ukxWjSUOCj3dYsbCDCa41byiS8lKoYA+bZ0Y0GVBwcdM+MJN
	IHR3O5CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh1hV-00000000vtj-0QGV;
	Wed, 30 Jul 2025 07:58:13 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh1bn-00000000vMw-2wrv
	for ath11k@lists.infradead.org;
	Wed, 30 Jul 2025 07:52:21 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3b783ea502eso492856f8f.1
        for <ath11k@lists.infradead.org>; Wed, 30 Jul 2025 00:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753861938; x=1754466738; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6l1gAO/UvA1KSMRC0e4WN8jJW7JgF3A+xKhsibHchD0=;
        b=BkiwoE6zb/B3zeGiBYGUNyutjuZEGQXCdwY0i0fzOUO4zlaIsCrxtrqzZtoiXwQ9C8
         fescpTIZyTD4AasqVP+vmMqyEurCTcolDgxr9YUEc4zUIK75xlacjF7Xt+sagzyW+Ksz
         eOD0N+gByyhquvKkAI9M8YHRuGB5jUZt5l8TTN2gABfCkS9M2oXiia+ST7jAK5S0G9+9
         JtVoJnAjI/p1VEESxYaqSKakzp7ti7JvRMg2rT9d6YWBC8K+GXt4Cqwk86un2i6gZt8q
         wOfLYZj8Xg2ObnI9HCLJweSNVql+TOEkxTL1Bk+rfxA9pFgza6nuRNVPK451X3R9nmY1
         aANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753861938; x=1754466738;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6l1gAO/UvA1KSMRC0e4WN8jJW7JgF3A+xKhsibHchD0=;
        b=vhp6jAVO/Mcs8rZ542ldbd47Chym7VMQ97AVk5KWjqDmazwkgHoOya3NKGd/2wduU6
         E3X2ScbhJpmFkOnzsKJgQiUSmvj8hlCPpVzAdEQKNacEz1x1T5yuZtHAuMYv0XPv+fVS
         +JMX1WiTv/q8sL0ioYxDO6G33Pt1nrV1mh7v8Eo2rkeESXpNJv9hMjlIRqYuKi4pbJdv
         1Wn6be//I2PhDxdnGtm1JVuXqPj/Bj/jyB0TwMhV9kr9S+2cLM+XeVW90RxDYwyh74fQ
         oYIVMgpRWVCsDRS3T9XP+0DJhU+t3h+lC6QwMR9pYpP9F31SpX0RxAjOpO91yH69Lfxx
         HQfg==
X-Gm-Message-State: AOJu0Yzv+kZF8A/Qa8oU4ZP9HAEXWv3kItnZyJFfFXoVkT7RZ+K5CwF5
	ZjW0f8h8JnOr8I5Gq3Q3TMjz77btg9BenLMQlAXXqHNKFtC7o9Rfg8fxTBCQeA==
X-Gm-Gg: ASbGncsEy9LThkz+BMiWOZgKQIbY+PPhrHfO/r48UELJW0uEU5MDcJ+bgD6LgrLgtNI
	xZPNcWP7twshQsTK/80mF2tMI1BG8yeqZ/TXiF9CLlKH8mjOOnOkHKtTGV1blN1+ScsJ68/PCOU
	QMAkbvYAJFOGph+PwD16iJ/5WNkRVUM/BhtEV6WLvup/SOBU+inn473FM1VIXdjEmbvQPjx3ReZ
	638u5rSiMxlhfGTysJw54E91lP40MxxqpUORV4sjyn74IDzPz6qN1mqBk+e4hp0a2lhhH5N91OK
	a8LiHjN240U0XvYl2BhrPgwCLG7v8r1f+moLRBDjJHVjYTi/wzpUE25LEFTX0Az2ULOJ5+EeDSJ
	t2nz7hBQ6higbRKz4pQ325TJxBhXFt6Sh3PuH9joL
X-Google-Smtp-Source: AGHT+IEpfcshaEmI74+FRPGDA4WifzJapnTiLXEYiP3DH31K2fBVogP/EMh4TPJeVT8GPBF/IKYPlA==
X-Received: by 2002:a5d:588c:0:b0:3b7:8842:89f5 with SMTP id ffacd0b85a97d-3b78e3d5a20mr5041589f8f.1.1753861937650;
        Wed, 30 Jul 2025 00:52:17 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b778f0c1b8sm14750871f8f.56.2025.07.30.00.52.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 00:52:17 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Jul 2025 09:52:16 +0200
Message-Id: <DBP862N3JBT3.2NRSJ8BECF0YI@gmail.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
Subject: Re: Missing BEACON_LOSS event
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Alexander Wilhelm" <alexander.wilhelm@westermo.com>, "Jeff Johnson"
 <jjohnson@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <aIjGvT+yQkZf8/Xs@FUE-ALEWI-WINX>
In-Reply-To: <aIjGvT+yQkZf8/Xs@FUE-ALEWI-WINX>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_005219_743011_08F460DE 
X-CRM114-Status: GOOD (  16.74  )
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

On Tue Jul 29, 2025 at 3:03 PM CEST, Alexander Wilhelm wrote:
> Hello devs,
>
> can someone help with the following issue?
>
> I'm using a QCN9074-based device in STA mode, connected to an access poin=
t. When
> the AP is powered off (without sending a deauthentication frame), the cli=
ent
> remains indefinitely associated. There is no disconnect, no beacon loss e=
vent,
> and the RSSI remains stuck at the last known value.
[...]
> From what I can tell, the function `ath11k_mac_handle_beacon_miss()` exis=
ts and
> is wired up via `ath11k_roam_event()`, but the firmware never seems to se=
nd
> `WMI_ROAM_EVENTID`, so the handler is never triggered.
>
> Is this expected behavior? Does the firmware need to be configured differ=
ently
> to enable beacon miss detection in STA mode? Or is this a known limitatio=
n? Any
> help or clarification would be appreciated.

Hello,

I've brought this up already on the ath11k/ath12k list:
https://lore.kernel.org/ath12k/CZA2NS7J83D4.18SU6W9R96KPY@gmail.com/
To my knowlege, nothing upstream has been posted so far by QCA.

In non mainline sources there is a patch to support ath12k:
https://git.codelinaro.org/clo/qsdk/oss/system/feeds/wlan-open/-/blob/win.w=
lan_host_opensource.3.0/patches/ath12k/897-wifi-ath12k-Add-support-for-STA-=
mode-to-trigger.patch
My guess is that ath11k works the same way.

It would be great if QCA people could mainline this, it seems like a small
enough and isolated feature that could be pushed without side effects.=20

>
>
> Best regards
> Alexander Wilhelm


