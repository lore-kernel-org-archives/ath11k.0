Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62478606A334
	for <ath11k@archiver.kernel.org>; Tue, 10 Nov 2026 02:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I5SlRIES;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jVUD/NRC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hhX/taozD8h2sfx0V2EzqRbzxnyILAwgPgnGX8OF0yo=; b=I5SlRIEScW/sRDAG1yducGnTJ7
	j3He0JDFnbph9moVGUUWTrn55nIUcIG1c4GPEW0gEO2ruopBRtHtlDYu1k3ZFRfGT4cXONow8UPqO
	A2iaMTF4tlBwjQxjwy0nLdET6y1prw7dw0wjU1QvHnsEuudbymJeOdG2/L399HFjcTj8yVcLpmWsq
	c28MRlrU5xfTQYQkDalxZvEWQd0doUGYv0ebyT2EnDZucbZ8QIkhfz7mH+MHruoxCHh+skPkNDnMe
	tt2iEiG/ASCHldsdyrGdK2YLlu5ok5mMNltdpBQK5VYusH8TeEDcjulGqdRWiKzVuhc928vXdTN6y
	X7pWmp8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQbRO-000000028uD-15rq;
	Tue, 10 Nov 2026 02:18:30 +0000
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQbRL-000000028tp-0l1w
	for ath11k@lists.infradead.org;
	Tue, 10 Nov 2026 02:18:28 +0000
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-5c9e7731b34so1100489e0c.2
        for <ath11k@lists.infradead.org>; Mon, 09 Nov 2026 18:18:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794277105; cv=none;
        d=google.com; s=arc-20260327;
        b=YtUeVN5rcgPZMToVEQnwADHwhR8/PPy1RS26oYffzR7tMq3Q8IeWxqvUs9tnNMA7FW
         tQex3KnV+IpLiSptLvZnHj4XdNsB8aRHNbZvCMLCFsivbXj3AqMwwUXOyXZeycf6EjCw
         XYfu9xcW0XzUtu0JPkQvVw2raLpqRStwFVMbULlu0Ts3r/4bCkFw825L3EhLLl5vsoTI
         llHSAAMnX722LBjGvGPGtffjTr1nZ0qhNEwnyPgGuIgaDyUdoLd7+Q1FUJ0FHtxE+LdW
         95xpjxlp1RtjXRFEzlsq9LS6SNOKteRRN7rbijrdJqq2020wVPnFd5lcenusPM0sX4t9
         CpeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hhX/taozD8h2sfx0V2EzqRbzxnyILAwgPgnGX8OF0yo=;
        fh=Tz93dG8IBg9iEY2Rjv6kAF0pMIm1taS73skdhlklY4o=;
        b=ncGkW5G+OpGOHRUNWv/DmcmZEIZeZTh9aasHtZAMsAwB7guFnri6yf/G4EQb7C+9X9
         qHHAyVSTZLEjIct/sfgyCivnke+Ue42gKRR/BJl1HdTioQR13/p2ggcULTvTqxLasS13
         qKeZtJzN3zAyZ68QZvZ0KlHmRsiDVV8FLnIJiWs1c7RAtBh52L5QKWc8xoAjtrNGlK02
         D8vsT+luzoMbMZGzkbDdUL2uJqUV3CrPywuUox/4a7mbYIxSngvT9Bpd8vPqSlirZIWF
         e/y/ghJxpOoi+4Unv6Tk+EKRC0xcuX+qbvfGJN5yntmMaFqHvyRlsPuxoXgNP/lFPl3b
         tb/g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794277105; x=1794881905; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhX/taozD8h2sfx0V2EzqRbzxnyILAwgPgnGX8OF0yo=;
        b=jVUD/NRCmrmjO95iTU3CvvDd68tDtDMwtXGvR9EAO2FrTqKJljbRJO62RxRTjJvnqV
         9WtPdxLakugXCc2lNSh9w64al8eHmFruYqhnTV8uwy3KcCdlOAf5S95oPr4nq9lUt2SR
         2+yDHipV/9vBtbjAaJHTuYR4NdSeXWD0tCYd5Xexk5uZLbM8WVa+P87sBNAM67h7jxh0
         27DFO5ocwi8RfTJBSsGtR9uTnmdz0/q2Wd3wc3H4+iEV3r2Xx9zZSXX2YllM4MnyDsH9
         SVYdEJTXYivxTcn7aylc9/tXY73UN7kcSomRw41lXq8e1bi60iCbN2WETX0etUlezC7Z
         8L9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794277105; x=1794881905;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hhX/taozD8h2sfx0V2EzqRbzxnyILAwgPgnGX8OF0yo=;
        b=D/JsuJXrtiARvte25h+eYZRKK+zcYRD0q6SF5fKFV9IbPYDgrHmXtkunt/kC+hAs6v
         qAnLgmUuOSlRTmao265ozRhmiDXYuAccA02m4mwmgPEAKzYClZuItc2GPu6tvkhww6S/
         3FfgKSOJKY5yNa2HLSbyrOKhC0XbcDGIPxiIvLgl6hE4iyS5mt5vUb27v5Yi0jvAIExO
         YANqzqCKhCaibkypyDn0D3i/5EjFjDMG4zRojSVff754OiOAJSC97muy/FEJp22hbLYL
         F4wMD9+k9+eu9GJN84MVgYp/Ef8n6gDJ9Vd0tk9I11sfh0JsEFYCc1uiAfJCnN9mK0rh
         elkA==
X-Forwarded-Encrypted: i=1; AL+hErGyGE8hd1i71j47193g+kdNvBTLphFZ6N7oAJIhJzrDULTYUS9B4nNZU3Sa0V2yAy8+BATzA9c=@lists.infradead.org
X-Gm-Message-State: APuU4Z+DjXNF8YQCQNEs86SX55WttTAb3QvLmdpAIUy7pYsrqeyQJCBf
	6P9mjsfazTyLflON7X0KwaKTLGrDgi1QepF0NlamvmeeBTAj9yrZdanKVi/7rCh4JoxvINn8aA/
	+92A8aOeKAEjEwEeRrUGpOEp4GuzUDtI=
X-Gm-Gg: AYBFou1uA+iSPLQMpHo94EeJXkhreEyn1E+wVw80sx81QNCtAJiUg4LQB7dkAqcfJr1
	+k1q0qP25dK+OWr17oXBLtoyd9/fjvhmcFBCvKIs0Kn7wlSMaRNFSanYTGBnUghRNWviITRF+rD
	m9zj8KmLn4v8a6xFDozYnbXxF69Qy7XN9JIgVTHRRZmYDfezfCtSINdMz/1GnUF10dsGG3I8tAY
	jSsHDE0soMEpBKgISCNtkbzIBTmjTSSDvaQMz4tPVvfOpLQAdr61Oc1JaAaBgGr91aKbicS8UGE
	aFHwj4rT5ZMrM+DjXtv5C7HnIBDl0CGIpdklW3e1tQsZRc/nH4UlSTui2vaGwUSkvqe8evK0mUu
	YXaEaIufSy8OLL6ZZrqSBkmOzt2PXk6WciYg/yC6KKIPm7w7v1qpdCAup4EG0m9b5iIftYtk6uU
	xSRldOEQy+1eA2jilm
X-Received: by 2002:a05:6122:469a:b0:5ea:f399:781d with SMTP id
 71dfb90a1353d-5ee0d1d05c8mr384452e0c.23.1794277105142; Mon, 09 Nov 2026
 18:18:25 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261108-ath11k-tx-airtime-v1-0-f1a02b2372d4@gmail.com>
In-Reply-To: <20261108-ath11k-tx-airtime-v1-0-f1a02b2372d4@gmail.com>
From: Christopher Griffin <christophergriffin05@gmail.com>
Date: Mon, 9 Nov 2026 20:18:13 -0600
X-Gm-Features: AclHuK9uu4Zt4AmknOEeRBG3AMABDQ7pzydp1LGIC-VkddAQ1RAQ1A1MKWWaYa8
Message-ID: <CAKobHXA5QnH+1APCD6rL-yS4LvSO5y90wEjk6Sz_uYhmfv2wmQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] wifi: ath11k: feed mac80211's airtime fairness
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, julius@bairaktaris.de
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_181827_232058_F55F829D 
X-CRM114-Status: UNSURE (   5.80  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Jeff,

Please drop this series. Julius Bairaktaris posted the same two
changes three weeks earlier, as patches 1 and 4 of "wifi: ath11k:
airtime queue limits, airtime fairness and a driver TXQ scheduler"
v5:

https://lore.kernel.org/all/20261018174904.1757161-1-julius@bairaktaris.de/

I missed it when I searched before sending; sorry for the noise. I've
tested his series on IPQ8074 and QCN9074 and replied to it with the
numbers.

Christopher

