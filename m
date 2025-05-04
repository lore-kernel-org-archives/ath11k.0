Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6D5C369DC
	for <ath11k@archiver.kernel.org>; Sun,  4 May 2025 12:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CM08xeHPPzPAtEx6J7jBMfY5mggSPnim894fiEb9CM0=; b=3Klk4Af71GRyuqlDukYxZDYXAU
	le+XV9oHCbY7/wjnJzJ8WTe5JaVl5tEW57fjDq846/X6PuVVsashTo93K/Lg73CUidEQT6LXCFPrp
	KHHz8N8bjv7LDQOA+WaCk2ScM3H++GF0D2byL1Qzr04OO4EorUekrR+a3BOuHOx2nlMdL7991WAYV
	tLat9jMuv/a2D5h6L5DAkhO2F95XBfjT9ZO4eL6Crfs1TDe4jI1ON0pHSTdhbzlegCQv3Cbt5pQa1
	jgkkIA6pZaj3Q4tkXq3+Vm8WgGgm3b8spjg6hCIsxqp7EzzlIhvxkvi9HISnutGBkFHn4T6HiViU6
	zWLGY6PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBYaV-00000005HVu-2kEX;
	Sun, 04 May 2025 12:36:55 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBYaS-00000005HVS-4A76
	for ath11k@lists.infradead.org;
	Sun, 04 May 2025 12:36:54 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43ede096d73so20470765e9.2
        for <ath11k@lists.infradead.org>; Sun, 04 May 2025 05:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746362211; x=1746967011; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CM08xeHPPzPAtEx6J7jBMfY5mggSPnim894fiEb9CM0=;
        b=i1MJwdzrkiRru7CaL286lV2F4xCuFa+07y8grzr41isumCwA/gnZXeR3KtZ5uPV5BM
         C1tzqFY6gg4GWg3tMUQf3g6NsO7jAKXU9SovibU6nx5CSbtNNHtQ1fs9xOhh98Ww0fHf
         rhk29SJKWlW8jtirCKaLBXGLDdmkmHN3sEhpE6cmwZIawOOKJpDbeFFkei3GrD7xya0o
         bO28ZO+3CrVT6CINprH0Ct6i254De4zeJIv141UR1rIiG9lLe16AdPxJq27iEmzMLiCD
         8fuorhjAYnNUZgGhRIa/lBFLq9xP3AwS3hBQqRp/4vnJfOT3lVRzGa1eceDxNQIPr5a3
         FIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746362211; x=1746967011;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CM08xeHPPzPAtEx6J7jBMfY5mggSPnim894fiEb9CM0=;
        b=tt77Uot/uJQn2ZLJv04MTA7MpeuJjEQ9VT0Jyy3bHT50rfiRw/jklK+jYuz8qlMsoi
         +YaoEQon90MLwlD8Sznf7KoqcrH23rhuyAnlTKu9z6gpQd5WVE31PEbNrLhRZ6A9SQWt
         NEcajJ9AvVStST5MucDuAvo01dcPTiOEt44u18uN96czCYHMqm7f9iFE3qKHjw3mQB52
         9PwCMo7EL1cmXpjHf668lp/kw9w0+tJVa1Z506mqWIOxOuSqOsG060EeCQeruwooCHkw
         ei82rdMMksu1w01yqunKs/HKFogXR5Obl2iCRl4gOppjF2iXX1LczDkV7zF50apWb4mv
         0SLA==
X-Forwarded-Encrypted: i=1; AJvYcCU5251PqLFQKMBIsWSCa/r1D4TNudNwSRgnS7iP0iViaNnvxqVcOskjUL4esUKlKHauxTo0QGs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxdPhom0elwXubTJ9+t/pv6jFi2ypT2deCXV+SwfXFgVS75GqaB
	y9WRCJe0MrWjeZ0RlRk+4nTDddhaSYI7wBW6G04Jy3KxgLyyfH3E
X-Gm-Gg: ASbGncvsME9fUUd62C1xUeGuTFBVMkEp3RqY//82u9YFnwKzXFuRQ+xbmzrPuOxVVu9
	wRm2qDO5nUsSuQy47uRyqYHWL+el1H5s1T1iwrXzHaI235WLyfgYl3RuExAS5+vlHcAA2ZWAP+g
	6GWaizChDhLDK1xlDB5OcUB26P6mihJGBW5nKdH15hS9Ix9Ep6ib/GdGW7ob1ToT9/+hxJcwvDe
	XhjWKu0cT8zzT3qZOJUEX1973ph0osUjwACih2V3/jn2PmuIHNYsYbcckPh7wclXb/s4OaVl0BZ
	+9kivxEV8OoVmLUBr1Tj1jh52Ap++fDfVERUFLGh+8wTCzGn7IAlYgcXcBM=
X-Google-Smtp-Source: AGHT+IEApNLeMqXPTD74HBZS5fOAX/1hg+752BPbILvPZGU6lVPtLCQ59W/vyrEscsgOIHE1jBlxFw==
X-Received: by 2002:a05:600c:828c:b0:43d:160:cd97 with SMTP id 5b1f17b1804b1-441c4923807mr26739845e9.25.1746362210525;
        Sun, 04 May 2025 05:36:50 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441c0dfc537sm55192625e9.16.2025.05.04.05.36.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 05:36:49 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 04 May 2025 14:36:48 +0200
Message-Id: <D9NDQJB4VMWA.V4IPOZOIR46W@gmail.com>
Subject: Re: [PATCH] Revert "ath11k: clear the keys properly via
 DISABLE_KEY"
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Vasanthakumar Thiagarajan" <quic_vthiagar@quicinc.com>,
 <ath11k@lists.infradead.org>, "Sven Eckelmann" <se@simonwunderlich.de>
Cc: <linux-wireless@vger.kernel.org>, "Steffen Moser"
 <lists@steffen-moser.de>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250117191455.3395145-1-nico.escande@gmail.com>
 <20e0a239-3d23-473b-5bc8-41bc25a64088@quicinc.com>
In-Reply-To: <20e0a239-3d23-473b-5bc8-41bc25a64088@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_053653_037174_460F9EE4 
X-CRM114-Status: GOOD (  13.44  )
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

On Sat Jan 18, 2025 at 11:29 AM CET, Vasanthakumar Thiagarajan wrote:
> Hi Nicolas,
>
> On 1/18/2025 12:44 AM, Nicolas Escande wrote:
>> This reverts commit 436a4e88659842a7cf634d7cc088c8f2cc94ebf5.
>>=20
>> This as been reported by multiple people [0] that with this commit,
>> broadcast packets were not being delivered after GTK exchange.
>> Qualcomm seems to have a similar patch [1] confirming the issue.
>>=20
>
> This will re-open https://www.spinics.net/lists/hostap/msg08921.html
> reported by Sven. The recommended ath firmware ABI during GTK re-keying
> is SET_KEY instead of current DEL_KEY followed by SET_KEY. We are looking
> at other options like some marking by mac80211 for the driver to be able
> to identify if the received DEL_KEY is for re-keying. Also I'm curious
> if roaming between secure and non-secure mode is a critical use case.
> If not, we can probably go ahead with this revert as temporary WAR,
> @Sven?
>
> Vasanth

Hello,

Any news on this ?
I would hate for this to sink into oblivion once again given how hard this
affects end users when it does hit.

Thanks,

