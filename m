Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E6BC0218D
	for <ath11k@archiver.kernel.org>; Wed, 29 Jan 2025 09:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lihPpJHFlhu1T9GX5rKbX3/sLgkFoYvwNag8T5iMjEQ=; b=WKvhWvsfzo2PC7HR+ThtlKIuV/
	AaMhBpg79SxZxGqv6apk779La2jb0BsZeM0JIurvFmvDeECLfK07mjml+nVkQLcJWZ0/sOi6t6/L5
	xwtfSGkBCS3OGIPKZ17yG9AAcUUEr1iXu0pC+KWKBE4D+xhRIVwD+xK8rniYbhfwcRAqKinu5D9Jw
	EkqlmA14hFjqe25WqtVKjWpM4NnOos76FB7wKR74QKmGyUaM9DCd8s2Z3XjHglcjQTC5UzK5Lxe7A
	/G0m+Yy3KYBaXS4mlkv9qBunSk01xs65SLb4gFvDDn2UnKsWvCI4xN41T1CTyV8cJqG0beD5z6+AR
	xfaPR9QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td4Io-00000006e18-21DQ;
	Wed, 29 Jan 2025 09:24:06 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td4Im-00000006dzr-1rwr
	for ath11k@lists.infradead.org;
	Wed, 29 Jan 2025 09:24:05 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38be3bfb045so323914f8f.0
        for <ath11k@lists.infradead.org>; Wed, 29 Jan 2025 01:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738142643; x=1738747443; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lihPpJHFlhu1T9GX5rKbX3/sLgkFoYvwNag8T5iMjEQ=;
        b=BducrVIhdqAA8nenKzus0OUDUD8BicjAVja4VMzfgOdeIBi676W8tDL8RWizLMn/AF
         h8drh1kpFWLRrwD4ZsfhuCgb6ArkEGcJFMN//WqR7Mc0hv0KOgn16s8vJWFkM1xBEKRJ
         Ok2lN95ovU2S8lUQ22dtFOje9WlJxnurKohf3JbBAF1qQG0rcUzaLgPIs0uquuL0sTd1
         5jESOLEZWCD2+e20W7G41hXRU9dOi1JE4O43Dp1zFWTUzpvCpdsN6sRMGsnQSSRPymvO
         mXmKISV+jZnGE9mxlbPPtLsXwpR9exhT2fQn/SpFbOE14PhKDEwIFK2yct1Vsx38eG+f
         Wq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738142643; x=1738747443;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lihPpJHFlhu1T9GX5rKbX3/sLgkFoYvwNag8T5iMjEQ=;
        b=BOnOsbm1T5lRA9NbXL8a41Oh+UU4h25H+v8DnnhWpDviOVeUtT5I+ngtWTc4uoy226
         Hng3AwwWtJ/POeIzhsHfAPctWbRn4C+1t5KHJxuNtuCK4ML26AERJYAiCA59vC8RJqui
         0oddXGlR6/v51Kxter0U7d4xUtWigwmctvwVwBbr24A8cIxLWa6SY9xG0FckT5BVa/gn
         8f4TB+1bXXhh3/asUBhHGzONN/BGxilEdRgbiTbRKv9BiyEbpKsZQPdE3z5ceqxptr9K
         4hnk7wl7vOhlL5yrpOYvrOd9QwRERMqDY3eSKBSmEfu39dsuA2k3ttDdcmUopSwHde/x
         w/ew==
X-Forwarded-Encrypted: i=1; AJvYcCUSXStRVxFukSyrylSvAK3dhbmrbR7h32769cqEYdVL4H/qYO5X5gowo2gsmem6GoV/PXeyRm4=@lists.infradead.org
X-Gm-Message-State: AOJu0YychKmfMrBFrPUzUyi1RZ0jMwvIVOS+9Uwtjwoq/iA/EHJZ099J
	Z9EQcdojzSu5JiNbqwSiN+Apr/0lfjSw6RuP5AzzIf2YgzDZn5Uz
X-Gm-Gg: ASbGncv5qGR+6TI4E+Lum7CMsP6xzow053HdfiuqaA+MsJS+ZK7L8PhBC1jJnnQfTz0
	rFWLijm3HSIldLqsyqaudEi4TlpLVuH3/o4ICpe4VeaFAWMxQDmzufKfQklRTFn0ncgbLDDWtRi
	BHMwNXdGrMaHfecaEgaGQuyiczD0haAUtCxRM2kR2zRhr3pn0beWElZsEf1CgVaHOU01dl3MaZb
	lf3mCALL1rwXzHb81O5DoLEmMUq17fbJ86WfB80eqSFaIiLM4VS/WdXj5nGZBAlYJOIR66Hpydm
	ETm9vvhiP3ST/rFhsnesGmQqdIVrJAveFw==
X-Google-Smtp-Source: AGHT+IH4Y4nWWV0fiFq9wMrFsPxfI+tlpUXenEohsMWeQWv89IPcCB4aUODTmHi762tZVXXaRACUYA==
X-Received: by 2002:a5d:5982:0:b0:386:3afc:14a7 with SMTP id ffacd0b85a97d-38c49a26177mr5242204f8f.7.1738142642823;
        Wed, 29 Jan 2025 01:24:02 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc2a96dsm15705645e9.19.2025.01.29.01.24.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 01:24:02 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Jan 2025 10:24:01 +0100
Message-Id: <D7EG56E1I0SX.3BZRTM7N6CQ44@gmail.com>
Subject: Re: [PATCH] wifi: ath11k: remove peer extra rssi update
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Jeff Johnson" <jeff.johnson@oss.qualcomm.com>,
 <ath11k@lists.infradead.org>
Cc: <linux-wireless@vger.kernel.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250117181953.3375273-1-nico.escande@gmail.com>
 <d5eda793-c7e9-453f-9dbc-07e5df73c47d@oss.qualcomm.com>
In-Reply-To: <d5eda793-c7e9-453f-9dbc-07e5df73c47d@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_012404_481287_C9483F79 
X-CRM114-Status: UNSURE (   9.62  )
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

On Tue Jan 28, 2025 at 11:29 PM CET, Jeff Johnson wrote:
> On 1/17/2025 10:19 AM, Nicolas Escande wrote:
>> Commit b205ce4c266c (ath11k: support avg signal in station dump) added a=
n
>
> I'll fixup this reference to address the checkpatch error:
> ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+=
 chars of sha1> ("<title line>")' - ie: 'Commit b205ce4c266c ("ath11k: supp=
ort avg signal in station dump")'
> total: 1 errors, 0 warnings, 0 checks, 8 lines checked

Arf I can see that the commit format is wrong but I wonder why checkpatch d=
idn't=20
arn me. Do I need more options set on the cmdline ?

	scripts/checkpatch.pl mail/0001-wifi-ath11k-remove-extra-rssi-update-in-at=
h11k_dp_rx.patch
	total: 0 errors, 0 warnings, 0 checks, 8 lines checked

	mail/0001-wifi-ath11k-remove-extra-rssi-update-in-ath11k_dp_rx.patch has n=
o obvious style problems and is ready for submission.
>
>> extra assignment of arsta->rssi_comb in ath11k_dp_rx_update_peer_stats
>> when it added the average rssi support. So lets keeps only one by removi=
ng
>> the legacy assignment so the two statements about rssi stay next to each
>> other. Compile tested only.
>>=20
>> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>

