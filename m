Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB79606A31A
	for <ath11k@archiver.kernel.org>; Sat, 31 Oct 2026 19:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RGsooEsT;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=NSC8hA03
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5O5IADadRA7OjjYl6cdAuBGkPA4cHFlxrAeTL7mxKBk=; b=RGsooEsTlxDO1SlplPjdCF4jn2
	0qsfNXem9ztp96FlnEukWZMcLAp9TgC1df/ndfjHGtiSaDozw1HNJbejSRZc2vzv/EpfbPvP5Jfnx
	whrJH9Sy1wmdlzC2E1LbaKNOO6kIoJqAFTfj2TW93g/5Oyc9H2a/Ve14ALkgqplDqyxIZ+am6Vs6m
	ATvNkmEoIsBT/6j4Jz7FzKs4rBs+a0/tyx1ynmfJ6VXevaToPWSLLSU/L19K5um7wtjs69FvO8C43
	vJ1mrGwQ8FKAxVXCeGh3+OTIxW0E75+VDlNB+mG7XxIFDfwzd4Db1lKVhh13gcpplzr1vUuNMRbGb
	e3THCHpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNFAa-0000000De91-0QJr;
	Sat, 31 Oct 2026 19:55:16 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNFAW-0000000De8e-3vK9
	for ath11k@lists.infradead.org;
	Sat, 31 Oct 2026 19:55:14 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-8b0d91601bdso22832507b3.1
        for <ath11k@lists.infradead.org>; Sat, 31 Oct 2026 12:55:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793476511; cv=none;
        d=google.com; s=arc-20260327;
        b=Weu+Ow0c9hhHV7/Eq6wQtX3wtBUTUsYeUtZUBgFHW+hAwiWUEZhIzufKP5TyQdkC2X
         8oEqcLyhz40honUi2OdhY5oH0ridqgbpPTMLN7W2NDsudExeHQZloyXetAODTmYE9q2g
         DsrwqX5YgBciHextWvT7T06h5rVLroewIkeqX498qrzrL8LaEn6jtdZkF09dxAyexotl
         IxejNWtUayryMEomJAh7rbXNaOp6G0TGcmIm513NxAZ0aErXonH7VWZJIkc+G+/y3Ut5
         M22jQWZYUCSzibzwNQgU9xDF6QhISifd7Bq7jhq4GuBvqfu8OXsp3q5tBLyn50mWK7MO
         HOPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5O5IADadRA7OjjYl6cdAuBGkPA4cHFlxrAeTL7mxKBk=;
        fh=qDu9SDrRvLtQKPDIpmqKiGrRPtgJUH6ZqfiE5ASj2Ro=;
        b=Et1j9njErWcT/PXohrp1y0TLNMzA7iwVMjMmlrFYX3hvzLUORJshdabnEAZtKO9Z+b
         dJ89/YYlMPsKQCzdAm6NzJV7Q20V7M5suVvhISUo+tBlfwrccofABtiFqm3tipUDnE3C
         NKygXt50GMMA+8klt/xQbnX3fGjq7348/1ySFpNjJFNVqrqXuY5WUynHnx2BXA5kMeyg
         Lpf4zhWPfpBPgoaJSBRAFPRyCnFYY0qG713vdom9EoXHRrQK+TfrCsGd/qJ/Qo8rmdT5
         z7TvpYPcBOZL0mPBzG+BrGg9c8kcDJY7fb3G7rWAIYFv6OZ8FfK5AeJxZRPVJ/s2KV/1
         VlKA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1793476511; x=1794081311; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5O5IADadRA7OjjYl6cdAuBGkPA4cHFlxrAeTL7mxKBk=;
        b=NSC8hA033usEGpHUysTTLS3VkKUt86KUaIoWaz5F74FXqXvjCce/Ffbbx+iRwCd82y
         535GNKZp0iYOhlsW3jbjvRdCPb0zAV2F0S/FOEa1LqGb7ly1CjVjvCpHHxE8qXW2tUW0
         HRBpB3dPP2qdMugcgbpURVW7UeiykxyuAi3EYiSairzi1Smo9Tnb96iY36M3iRNe54zB
         jmm+zGFowBfZsHL1QtTnZCNS1Vex32EYiIWJoJOwHuIBAvNqzkZo9zaXUhjFP4QPC9B3
         +uNzX0oUr5q8i2nYgUjfa6a29FRQzRcfLx5FYI32iyLOglry418C3BDnzoKc+R3wlNB1
         8ARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793476511; x=1794081311;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5O5IADadRA7OjjYl6cdAuBGkPA4cHFlxrAeTL7mxKBk=;
        b=XLNlAT48ogJHqjzo7SEb6ZgGr0qVyS+dBG8/hT30PhW663KMqvIGdrQlsuPRlm2ltv
         bfsS34yzf1jpPMosHf3wOWaB8EiglsnZrHn0kMwGUqFyXpMEBhZdaGxxjLACLwNsm7U4
         PQy5Jojs7lElyhTGR8wRp4W3q0EeV7G4yZqieNZMo3dV0sJqfuEGUk+ZRoJxVhUZ0Cmv
         wNybKGnq5P8ENCGrjIQE4iSSHZnZhwU9KBFvOfAD897pqTXez3SrjFjT+P+nJLlc5fu0
         00OeCvoHQdVHEOuIHJNH74HVb1jp0J+gzLl3WkTAFMjnXfP9QB2dMWZny9w4D6A7OiFD
         /75A==
X-Forwarded-Encrypted: i=1; AKwUvBwk5PcAugiVJIjA6GxFtj4br4bAI+NIbxxcgKKDE4l59h8L9SS11oZHhFHk3ri7pUh+KfSodIA=@lists.infradead.org
X-Gm-Message-State: APuU4Z9IXk2z4eEvHhyBU5XfRCUzQJUixlNZuy5JWW+xAmF+zhyh8NzZ
	ulGpHHlPvD0JQYS29U84W69fMmtA7kMqZPnkOuP4exUw5M0snLYKkQlezY2uP5FI56pRkwVA8NK
	jGk4xaKStDaBWPhweJVAILXUSj2VOT/h6xZfBKIL1
X-Gm-Gg: AYBFou3nTJgSoscgLS+LDA0mIOFVydKvhAv9Mo7ktERLsFGVylzcaH1rkwPGsStu15p
	g04oLUqw/c1z9/5zVcoWinit4xs8gbs8/cDSMA7eHuh8UQcyFXAEv09KxZbYWU2RpeFBqeesDCJ
	dxoU1jvakG4V/VmGqqMHd7soc2CP4Z/jX39kpbrRNMrPiy2o2/a348tlKg3Vvi18RhegT7UHa4m
	vIYIzH1T87MhtdcTuw4xEK3KXnv45n5GbGp354fp/hjAYVeZ4BkTIA62PMWbTqZjFbbP5TuUNw2
	VKtzaEJslr9rWEts+h4s9DYf3nfQ8IwbfOacdjh/uKe0u9/wH0K/f8d6EStQQmuIyrC007jryYL
	MomlOAjNjQZb0d5+fgMbUTQynIIUMYo75uGARnop3OsIdsPYq300WLkxz1QC+Kl/SxcypjqDhh8
	LnUMSZr2KvGV3aDYpWnIXbkSmdKt4PKIPd5LE3jrwx55aHLnLDV7qHIQgnp7PPXYtKuQtKHKbJG
	OqiTWhoDgILLQkBY4SGzi0mwWYHPEh/AKbMJEtAFsrYhjYO9AOGX5ENBeOFL8ye6Izv9qWE8DUV
	/hivy9UGoNxygkbT4t9gYRQXs5/sUgR+U4FGL+JDmw0U6TEdSLDflfRs3g93dKpuuM71RBTod/R
	aT9lepZeGL/gPAcQujLTLhQhP5hImdg==
X-Received: by 2002:a05:690c:6612:b0:8b1:6c4d:6b83 with SMTP id
 00721157ae682-8b1c6762363mr64199007b3.24.1793476510987; Sat, 31 Oct 2026
 12:55:10 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027075544.19144-1-julius@bairaktaris.de> <20261027075544.19144-4-julius@bairaktaris.de>
 <7ecbb748-85fd-4a5b-b673-3f29b683e8af@oss.qualcomm.com>
In-Reply-To: <7ecbb748-85fd-4a5b-b673-3f29b683e8af@oss.qualcomm.com>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Sat, 31 Oct 2026 19:54:35 +0000
X-Gm-Features: AclHuK-y6ZcuKV4f5uzsmB8CJRCLAxncnpWnV8eG7gDPJlWCxU7zg7ukuzbMPBc
Message-ID: <CAC1t37K+SCBFbt03xWrdgreaWctwx5G7uEYfyjRHghztKaWR5w@mail.gmail.com>
Subject: Re: [PATCH ath-next 3/3] wifi: ath11k: add a module parameter to
 select the hardware mode
To: jeff.johnson@oss.qualcomm.com
Cc: jjohnson@kernel.org, ath11k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baochen.qiang@oss.qualcomm.com, strst.gs@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_125512_997413_EF9A429D 
X-CRM114-Status: GOOD (  10.12  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/28/2026 12:03 PM, Jeff Johnson wrote:
> Is there a different way?
> Adding new module params is frowned upon.
> https://www.google.com/url?q=https://msgid.link/6d553cffcb0ae84e141006ae1430f6f37909ad2b.camel@sipsolutions.net&source=gmail&ust=1793562736182000&sa=E

Yes. Which mode the NBG7815 should run is a property of the board: Zyxel
specifies it with one 8x8 5 GHz radio and 160 MHz [1], and its board
data makes the firmware advertise DBS for that. ath11k can then pick the
mode from the machine compatible, the way
ath11k_core_usecase_firmware_table[] picks the firmware for WCN6855
boards since commit c386a2b10689 ("wifi: ath11k: add usecase firmware
handling based on device compatible").

For v2 I would replace 3/3 with a table of hw_rev, compatible and hw
mode, with one entry:

{ ATH11K_HW_IPQ8074, "zyxel,nbg7815", WMI_HOST_HW_MODE_DBS },

ath11k_wmi_tlv_hw_mode_caps() takes that mode if the firmware advertises
it and otherwise keeps today's choice. No parameter and no new binding.
1/3 and 2/3 stay as they are.

A property on the wifi node would describe configuration rather than
hardware, and the series above deprecated firmware-name in favour of
the table. A runtime switch does not fit either: the mode goes to the
firmware in WMI_INIT_CMDID and fixes the number of radios ath11k
registers, one ieee80211_hw each, so changing it means a firmware
restart and a new set of wiphys.

Does that work for you?

[1] https://download.zyxel.com/Armor_G5_(NBG7815)/datasheet/Armor%20G5%20(NBG7815)_4.pdf

