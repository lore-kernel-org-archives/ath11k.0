Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B796CA0EF5
	for <ath11k@archiver.kernel.org>; Tue, 19 Aug 2025 09:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U6LpYnTCfo4Gg+5fyuVTe6zl2UfoAqsiDIH2GpQbPVo=; b=QeJY/rjsj3al9LPtPdno185ROR
	u++Q6SI0Lh60aJ+stfxblmJv1CYnYXlYvKlaDEpAl6jAFNdRIsGLB1ErVpR2lAm19eQfKlNWXzjaw
	qMzcbdtBDrYfyctUCwUD42/tOADYqsFXWl5PVWv0V+mqAlIKyRw6JcpD3qj9etw7segn5lmQZ/q8O
	dxE7XwLmSRYDJg3wusZbCD/5Qnn3WRk48kR2PCVYqje4iH8Ur+iNY2SnFZZ6EMKATh4e0fG5cvjHX
	TZLnK+mQ8KU3cHYdk8lyLHpBpMl/4CMhNjrgZPHnZvPMeDe5xsdmVyuBGQxVjNEtCDDqFFZfUoSkr
	c5POMYMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIbL-00000009x2z-3cLZ;
	Tue, 19 Aug 2025 09:25:55 +0000
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoI3x-00000009r7p-38Zz
	for ath11k@lists.infradead.org;
	Tue, 19 Aug 2025 08:51:27 +0000
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-89018eb849aso1461894241.0
        for <ath11k@lists.infradead.org>; Tue, 19 Aug 2025 01:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=moment-tech.20230601.gappssmtp.com; s=20230601; t=1755593484; x=1756198284; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U6LpYnTCfo4Gg+5fyuVTe6zl2UfoAqsiDIH2GpQbPVo=;
        b=yXKW8OZLdZ87LLDZo76bz/DAt5jHqrseHUNPvxzQUWmAEP9ZMLCECcIFcUmVvVdI3J
         GM+3kvM2BnJk/p+ermn7GEPLp2DI3GVWuGkM3AxGgWSk7AcRpQShnlRZs85bWfG+JVpA
         KaEqsJBT34S2+14DNpOQNck+Xb6ObjgSe5wIhBBhbC74+oinoGg5wO4yMlNRBXehn2nx
         BB/G7ivx8qSYy+cLnICVwueLft+BTyHf23vJYuiQLUqWQJ6s87pSOcakT8lnZOeFyNLM
         xxgc/txaicdts66MUoj7iw2ePmKbeWum8UA6KugnR+oGxRczWDN2Py23RKYyAehWLEcV
         EQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755593484; x=1756198284;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U6LpYnTCfo4Gg+5fyuVTe6zl2UfoAqsiDIH2GpQbPVo=;
        b=X1i/wSyqCySK46yEDqTdE3uWFUMynpKoDZtGW1K2n+aehlRcNdfd/sM2WPTOqIREUo
         Tfb8S0fj1FzcXRy1uk6OLlxL07BHQQ/36tj87pKPbJVPSWtoR6iI6G5FeWs6FNVpOhaG
         2ZJiVHVzXOlPmZ2wXYIf+6c1E+rmJdngd44GwGSYUO4nHKqrEKctUs+efU8Kv5K6BMKh
         x6wwwaLtKv3+GvGSn6yjn7MJ67MFXGUk7cvLAWl70pXw1MGhVcP6clUPglH6hYXKAytB
         fZdTzY565IJt1Fqpr8U6LmCc7mDfV7uYpTD03JEBMgNGt+ubi2gKzAjFdPFvVqv+Qyvw
         8nwA==
X-Forwarded-Encrypted: i=1; AJvYcCUqoeCmA2gx7NGYWzjrF46xMrUCWFgwSeOG96IkTHh2prEGiqCYR4uJAcpIbcS9WzlRUYGOSnQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwRK4rJJWuZTcgJ6kjY2e6fo7DQ1MEkyo+z/bwyZH5AU//R5Q+K
	faNcWsbF00yKAYRecCZdni1MmoC/mYUlmMjtivn/lW4nvS1rxdSA13WI3t7rrnRyvE9T98/Qjac
	Zw4YW6J/NojmFyQa6A2ozrlt5H4qvgn5eAwdPMWcRYQ==
X-Gm-Gg: ASbGncv7H6FYtnxrk9xsi9j8GH8f4+F2Z2oWMzvBXDVwtig8Dv+INrCW+2iUjymcJsa
	nsRSMZsCrTgZjAlpOn0BTydAHz3Kl245RlKOBGioyDocApF+nATC2IR8eZIKcloJU6ZxiJsEQoc
	Vqi4NBTKzq0gl8IqRZ1NKjIB2oQxbpJ9KP1vKQtZUvsRe3kEuGrkwGwMroVAL3uDs67ASV0MVNS
	VGhiSH5HzGnldV6CJzB
X-Google-Smtp-Source: AGHT+IHn+JAaOrC4ZPZza2tWcjwOoUJwn4XbVQAwuiSlaZvGn1XN9WfH1oIySLhW2qGqHs++WzaNsKNDoyzdjqTKQUU=
X-Received: by 2002:a05:6102:6a94:b0:4fc:1484:5500 with SMTP id
 ada2fe7eead31-5192442a3aamr426413137.21.1755593483789; Tue, 19 Aug 2025
 01:51:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250611164004.38580-1-balsam.chihi@moment.tech>
 <91fa8b1d-7bd0-4beb-80ef-eb65d2562f17@oss.qualcomm.com> <CAONkfw5Xyk8CGmVDpWZfkWnuCcFq6400jUkqyeMDtS0UNSh9vg@mail.gmail.com>
 <ecab2156-b234-4fba-a2ad-13a2d9b4693f@oss.qualcomm.com> <CAONkfw4hkDQtJyOj4RVsR3V=FJDJYKnjtmqzD=jBMy1ax=tC_A@mail.gmail.com>
 <0dfe48fc-085f-4dce-933d-e0f132d2ff9c@oss.qualcomm.com> <CAONkfw4p1AuE-MhGiZNMmi-PXR+CjoY63K2Yx_dmv2vnjo-Eyg@mail.gmail.com>
In-Reply-To: <CAONkfw4p1AuE-MhGiZNMmi-PXR+CjoY63K2Yx_dmv2vnjo-Eyg@mail.gmail.com>
From: Balsam Chihi <balsam.chihi@moment.tech>
Date: Tue, 19 Aug 2025 10:50:47 +0200
X-Gm-Features: Ac12FXxD4wigLqYZhtA3A9FdduCE-sHZ7cGeGfRKkrACvF0m42gxMVS7V8_5bwI
Message-ID: <CAONkfw58jcGRxotm2zJasQd56oDR-h0b3Z0Yi+pE8hdrmN=Ucg@mail.gmail.com>
Subject: Re: [PATCH] ath11k: pci: avoid unsafe register access during shutdown
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	jjohnson@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_015125_894568_6F3D24DF 
X-CRM114-Status: GOOD (  11.52  )
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

Hello,
I Have a question on the same subject but not related to the bug.
I have many identical PCIe WiFi cards on the system and I need to load
a different board-2.bin on each one (1 adapter per frequency band).
Is there any kernel built-in solution for that?
I could not find any, so I had to create a patch that loads a
different board-2.bin for each card based on the pci device address.
I patched ath11k's core.c file so that it reads a string from a text
file in the rootfs (board-2.bin path per wifi card).
If the text file is not found, the driver loads the default file
provided by linux-firmware for all cards, the original behaviour.
Please let me know if there is a better solution for that.
Best regards.
Balsam

