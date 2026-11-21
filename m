Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358DF606A320
	for <ath11k@archiver.kernel.org>; Sat, 21 Nov 2026 16:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SPmZJTo8;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Y16O/kE6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=P/gSH84W9nTAHSSAJ/t1/ktXrTVBa/4q/QfiolBhcqw=; b=SPmZJTo8eAUQBA
	komfVe2nFO+0haE1+9hlA7Tn3EdleYy2Q02i4srDeIekUBGn7nOMumzPtw67Po61WBIMqNiUdM5+f
	Zhv4650pHhnsRBiIrrC5DRYjtZbm0stExunvAt7kRbIAzSSenNrCTNveaOXS4PHhAIodNsKqRsWm/
	HYtOG93S+azz6ZuA1Pw8s2UHTBuZ9tvrj8ShEjNAl8TyO1K+To/kIA9dS4IHL4wWQ8JfN3Au6LNm0
	RtuTR++p5iWmuYjtVq3ZQV8mTDhf6YwEwq1lLvRdSn7ZdbSQKc80pjnWeJXQIISTrXPwmrrEJuq6V
	SiXEgcHe7RIFTAeG3wPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUoEd-0000000HW0z-3slo;
	Sat, 21 Nov 2026 16:46:43 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUoEb-0000000HW0Y-15yd
	for ath11k@lists.infradead.org;
	Sat, 21 Nov 2026 16:46:42 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c5133831027so282593566b.2
        for <ath11k@lists.infradead.org>; Sat, 21 Nov 2026 08:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795279599; x=1795884399; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P/gSH84W9nTAHSSAJ/t1/ktXrTVBa/4q/QfiolBhcqw=;
        b=Y16O/kE6R1wIpEx7OqKfvXlZ5AJHOj95iscn3MhEm6BSlgZtJO1cWwWF6dEy9AguEK
         xNmLy/EGRPMvK6TtJVl6HStUT30zc0LXkmkUFk9sCEwV0jyhGPefJjZycEjAPcmei9kT
         47/dQhujpsTZkzmOQ9IBrX9byAeUAPt15n0xY07hs5FYIg/KhRDKqtOYR0vL3JZ2xkSp
         ZDX92Si5P0gwt6BY8zXO55oZcuU2KnB14zV3FS0ml6zgwxeGuA+cKb3pHyaKx+26YqWu
         04g2I2yYB0bEQslKmXdp6t/139tbipeq9O5C6dyKC1xH1zzyUDgdJtbjyWyuaZJBcn4x
         7iPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795279599; x=1795884399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P/gSH84W9nTAHSSAJ/t1/ktXrTVBa/4q/QfiolBhcqw=;
        b=uZ5QentK5Fie5vAhP+xyG/GzJa6e9uKzAooqBwbTjEe+WDL1+l3wGlnbjm1rjeMbXG
         K8qkwyDRGD6Wqb1zChi3/Y1t4wdc0OoIadJ5k8XxpvN2i4rUc8oBfCcgsOlYNwusqr3m
         8U4fZ7usVYb+tqXLT/eMbFWvgHRA8wdooe5iG0qrnefOlmaf9zFl5Z/CsBFL+tIVBA43
         wbY35vQgGD1Y7rMjebWdujFtBJcaK3rrJgHyF/uOxEM97emv6f1N+yrg7f82wB3239UI
         ALPYFjDBG/7QaCjbfQwhse0EPkzgKi4b62fhs9lCNHyNAriokSCbanXX+BMbaYojTqee
         aIQA==
X-Gm-Message-State: APuU4Z8N0RO/IPgdX7CzcIssF9ETkFN1aSmhYavfX5jz7bTLUiMvum1g
	OsGn6vDlhQHx8wcz76bSSg7qi8e/smaYptRexWGYqEuGK7ZdC9rIvAem5EUS91Mxuw==
X-Gm-Gg: AZFdTZdRHG2+V1YSdOlQtcQ43/8EPs8PE6yIoV/ycIXRchO7fmws6z7gLqZta8XEXFs
	MlMYragY2CHGYClFaSc+j39s5zUn0CsfFeur6L1Rc9po/ksGoHsk4Ir96fCVOsYmiWruQGspjbm
	XI6j/Fzey2d3njzAOMuapur4vx3zrWYMNQo9uLDQf1Iqylg5lKqUWXQxchGwmuboeGVMeYEjtvu
	sXTab/lE9x2k3VtJrOIsdekjC8YB+JIVwH3gmUshiLcFTMV4BdkmXenQKPMbLqJ3mUtkXTzBtRz
	sttfK4paaUqeJ7TPnrez5jS1C0fZczHzovH8Ci77TPT/zijZT7b3pMAj69FBSTqWsn6ipioaHgL
	lYcWqVJ2rADhSBi4icBlFdvPXAp3CxCLNpKes7wuTWmCJNpF+l0J5yFOtu9UmSI0kLnizKPYl9C
	YCfT/H8B0q0m0bVEFiCjoHHVbSjyNtSwm4dfp+T04KCIndAk0VaxXftlD43cxvHFvOvQ/KIYUMR
	tnoTwU+VPb4JOiqW09T81F1x6J33sdtWYQxLnGYaOCDCG/xXSsUzZMMv4/UHrQcbwJHrblhhKbV
	xZEK9MRf1KY4ksELDnwAQyr/XH63GI3Jxq45dm7hgnPjmqBD5k1tpQ0ZlK/6zmGfv4I/tiKNLe7
	N/9r/55T0WqnYHswfqJTHOgnFEvaeaB7NTWprsTGHnQMbfkWUDYlMsteRQhdX2jVGqjv1h9Qr2d
	2KTK856NnXa/+HduibW5T2BtmUfcHPZBwxuNsFXvnPquKNn7nIGeSfPAByRKc+QC0I94UU944pb
	dsVeZfHClHWZdRJ7W41DoHb8DLTAWFanDw5uDa0c0SkVcQNJkd4bXyoFttfbGjFXUpxYCv6m/zE
	utvE//cYhrlwsRmzusPAPZ6EXjSBWGoavdOeP3dTMJMvO2JsAWVYBwLBeFLkS5vBoVtHssX8vBu
	JBg==
X-Received: by 2002:a17:906:3e1b:b0:c50:93b6:52ed with SMTP id a640c23a62f3a-c513aab27ccmr426031766b.40.1795279598346;
        Sat, 21 Nov 2026 08:46:38 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470da3000000000000000a27.dip0.t-ipconnect.de. [2003:f2:470d:a300::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8f70fsm213796366b.40.2026.11.21.08.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 08:46:37 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baochen.qiang@oss.qualcomm.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com,
	kvalo@kernel.org
Subject: Re: [PATCH RFC ath-next] wifi: ath11k: advance the TX PN of keys reinstalled after a firmware restart
Date: Sat, 21 Nov 2026 17:46:36 +0100
Message-ID: <20261121164636.3949260-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018210212.1926073-1-julius@bairaktaris.de>
References: <20261018210212.1926073-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_084641_316019_7DBDA93A 
X-CRM114-Status: UNSURE (   5.55  )
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

On Sun, 18 Oct 2026 23:02:12 +0200 Julius Bairaktaris wrote:
> Which command or field sets the TX PN of an installed key on this
> firmware? Without one the stations need new keys after a restart.

Please drop this RFC. With key_tsc_counter set in
WMI_VDEV_INSTALL_KEY_CMDID, WLAN.HK.2.9.0.1-02146 still started the data
frames at PN 0 after the restart (1 run), so the patch does not do what
its subject says.

Julius

