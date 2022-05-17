Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51967C433EF
	for <ath11k@archiver.kernel.org>; Tue, 17 May 2022 16:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vkKl2H89zs1YPyPXSi/A2FXsjhrw6/rkUujLdvZRjUg=; b=j0BFY9kjUxSHpu
	j/q4pq3A2TYIYAWAEgSkP7+1rLCi2H6+Ar9185+yApIVb15He1CBeXiyDYVNOFd+EyOOrDhuYwov4
	1bCRi1MDSo87IBu1U3rnifUiWsD2eJaUcaEM23/UFZNeG1KXbhU7HQvf7BEM+O5tb5SvAoKGxJ1oe
	5z2xlv/2+w5PCbtNZmRzYh4koHO34t1/qz8eczzbJC345urXwOuja1IZ+ysvi5R4oxtSFPKqaV5md
	hfQeVYw5We5BgABV2VX5TbqTqWkNwnHSWUsiSfxavgKl5CCjr6hkZaRz1a6EVTGkSI6+cJwSgTXIm
	Tbdo4me8SlKQyaDnbTTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr0MB-00EuHK-Ku; Tue, 17 May 2022 16:47:35 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr0M9-00EuGD-7a
 for ath11k@lists.infradead.org; Tue, 17 May 2022 16:47:34 +0000
Received: by mail-ej1-x633.google.com with SMTP id g6so35853364ejw.1
 for <ath11k@lists.infradead.org>; Tue, 17 May 2022 09:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=cVosbNeAY2VpmimOTJf6JBd0lR22FUVTeGSWpMt1Wi0=;
 b=c8kC+yd+I2MobMma7CqsiUk7EwHuPDzFAkJVpqE4k6X59RUAv6E0fbQCs9J1wEqcaN
 I6YCC8LIPoUl1FdyZJazqqYivQSjm4+K6JWqtU+6p/+BjtM31P9+kJiC715PrbL7F3wy
 QlniqSIHVC0fYSomPuLHqY9WlkDWLPVIIuIw4HFfobDeYgfjebz9K+I0rz1zsUvFRmS1
 rIHpnb0CTyYvd89qwIo8Y8P1DP2dKUzjUvnMynA1aT4QXUYcyBMWBTzCCfznazLFRpDb
 4lqCRJcbKEfcrLeVwmlH1Ay5C1fYcM09ljOVe2AC9EyYKymz8q50tqvRUYdDe4nqz0Mm
 r3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cVosbNeAY2VpmimOTJf6JBd0lR22FUVTeGSWpMt1Wi0=;
 b=R0jkH0FrO6ez1nydOJMmjnnsZT6j4FgFuSoM909CsKqaFjuEG3KAu7673KPSp+ILbY
 /5ngAlLOXq/mpRlC+7waVNm54F+WtVRhivbloI8+5FVVz05PceHYPe0fBCtYqNJ2V28X
 dUd6SpY/milhfggsDdjeKmwHKBBZyPLNrPMmIz26nUBwgoIkzt2Ldx6Hq/NCoeu90uVk
 2Fch01ia4gMBy09q6FeHAtPaBO0Hre9SaWNVpaz0kgPgDcuATTjNWkzP3JsxqEly4V7o
 MhSZOuiOxi3Be8HlOwNqA3qU32z4ZI4dTNVaHUo7MuH6h3oQ20n7TbHn4Pp+StOlcHUD
 H3Fw==
X-Gm-Message-State: AOAM533lcKyOUGi4gHrCoFgsw9MUw2nlZ5GFwuNH9FdONELyfQzpqkLU
 BXNTQzIhUK1guTh11OcZuV5oPH4Bm0oSiA==
X-Google-Smtp-Source: ABdhPJxdaJNGYdA0lLApIJIKKvBe2ko9HKD1JqXnOu5zHWWPHXp36wlGhjphyLW2TKYA+8zImJ22PQ==
X-Received: by 2002:a17:907:3e28:b0:6f4:3ba3:504e with SMTP id
 hp40-20020a1709073e2800b006f43ba3504emr20607721ejc.632.1652806047972; 
 Tue, 17 May 2022 09:47:27 -0700 (PDT)
Received: from [10.8.0.6] ([185.17.123.199]) by smtp.gmail.com with ESMTPSA id
 f15-20020a1709063f4f00b006f3ef214e6esm1249056ejj.212.2022.05.17.09.47.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 09:47:27 -0700 (PDT)
Message-ID: <12e7ce31-33be-c59b-402a-a00d2723540e@gmail.com>
Date: Tue, 17 May 2022 19:47:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0
Subject: Re: QCA6390 power saving issue
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org
References: <a70aba8a-cce4-a84b-ea70-5761bde1cbe5@gmail.com>
 <87pmm3x424.fsf@kernel.org> <da91be76-d609-ba29-76e6-5365ea1db9d4@gmail.com>
 <87a6d7wqsu.fsf@kernel.org>
From: Mark Herbert <mark.herbert42@gmail.com>
In-Reply-To: <87a6d7wqsu.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_094733_319471_BC4F4197 
X-CRM114-Status: GOOD (  17.82  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

I have tried modification proposed by Wi - but still same situation.

Also I've tried to go same direction and injected the call to the psmode 
enabling fuction in multiple places of the mac.c file. Enable debug mask 
for mac events - and I see that the code is called many times now. But 
still no effect - until the first connection to network happens no PC 
states more than PC3 are reached.


When first connect happens - all good till reboot or hibernate.


On 3/30/22 15:47, Kalle Valo wrote:
> + ath11k list
>
> Mark Herbert <mark.herbert42@gmail.com> writes:
>
>> Done - https://bugzilla.kernel.org/show_bug.cgi?id=215775
> Thanks!
>
>> Checked the previous bug - the powersave activation is done only on
>> change of something - so when the driver is loaded but never connected
>> so this IF did not become true at least one time - the powersave is
>> not yet enabled and card remains in the initial setting keeping PC3 as
>> a lowest state. Seems that when we initialize the driver we need to
>> call this ath11k_mac_config_ps(ar) one time - then on each change of
>> the connection the current code will handle that.
>>
>> @@ -2942,6 +3019,16 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw
>> *hw,
>> ath11k_mac_txpower_recalc(ar);
>> }
>> + if (changed & BSS_CHANGED_PS &&
>> + ar->ab->hw_params.supports_sta_ps) {
>> + arvif->ps = vif->bss_conf.ps;
>> +
>> + ret = ath11k_mac_config_ps(ar);
>> + if (ret)
>> + ath11k_warn(ar->ab, "failed to setup ps on vdev %i: %d\n",
>> + arvif->vdev_id, ret);
>> + }
> Didn't check the code, but makes sense. Can you or someone else send a
> patch, please?
>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
