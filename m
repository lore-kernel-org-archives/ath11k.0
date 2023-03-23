Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7B2C6FD1D
	for <ath11k@archiver.kernel.org>; Thu, 23 Mar 2023 09:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5mWxcctUwMRjndeLuo5r4kNbvZz7bs6xM4Ukevmbk34=; b=ioY1IfPQSWJVvJ
	aXEP1DVG7maAjwRpsBbP3UYHUfsA9KfTJ4rq+fQ66vORKUv+Yesn2V9hDzEAktiDwvDe1NbUa79FR
	Bz1HxFxfq1ccqHj/zw/S7sdYYO+y5Bgq/JdGbt2SYoL7FmU8IOzTY8JkR24WxwNH78gHZxSuS7bGa
	rCe0g+5KDAFKrykD9E0yxPxdNo+DTi6KQ80+ECsUZd8P08vDAMkhVG4y6YwYiS1cN0ho8UZ3bYzyM
	JLC7p/xZ+evLAMb62S4bPYy9tgzJTkL76vgqg8nwEGr3yjnlxa+DuVeC+Pxelq7mpa0UaFumlQYA9
	3PuhcgjeIn1SKEwx0BKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfHLt-001UKr-1z;
	Thu, 23 Mar 2023 09:35:21 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfHLo-001UJV-2L
	for ath11k@lists.infradead.org;
	Thu, 23 Mar 2023 09:35:19 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id j7so24021192ybg.4
        for <ath11k@lists.infradead.org>; Thu, 23 Mar 2023 02:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679564112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JF+vGQVgdI6sx9plJs4AJswLA4WXZNTBD08CbZnYmOw=;
        b=qgnBDQsImBRsBRzL04y/XruUAp85l8H3/quagH2UU3puPCBRsAsmXcd0fQqkGckt22
         3VLNedY8PKZr5ZwPq1czPzZAkvbryUhYFIe0hSApclFTrouW4GcL7UR1EUL6+juQphEt
         uHYHwGObMae+CTi4Q5Rj0hbbE4nGkI4o8qpg7GdTOkBwLf1x8nkqJJPdyYBRX7Gm0adu
         Wt2WlQ5ByWszvYzJsYf/Gwe3uwr7LDZlJPViam/w9AYmGiGpmGE7WFRszWLdCSA6j8nI
         klqDqSxihNxQSyXykhMvL26Ym84VBmx7T3oeSM8bqxRlXHQNGqNKY6My2yKDO8cP2/m3
         GqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679564112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JF+vGQVgdI6sx9plJs4AJswLA4WXZNTBD08CbZnYmOw=;
        b=Nc2MJe+Aq1NXAEUx7m2lLQ3biO0Y3IFFG40+C5rm5rvmlweSkyzp7oZBpSyEF9hmzh
         9UinFsDivcUXUjpMYo+a8kwlu2b4CUHqRcx8BotHJFOp0hGAEGHB+bNWM8BNDTLYOIUy
         WjikTwbI7W7qJ2t6IaJI7rJChHqn5IJggvcvCbo6pTS2ZkePlX8NBEaLngwRMjrryUXl
         8MHXMJsSESoPgKeGvs+q4bRwHhfshoXvJV5f7DxP6LNLVRs4k8ZRi+SX5Fp5c8pzVkON
         eElxJ41tyHbfwIIdoG9nh8Xn3opfXNcgID9eBV5taTKSAox09RzwyQFxPUMh4ghz9rVR
         tMmA==
X-Gm-Message-State: AAQBX9exkqX28222Xvl5HC9XtfVMEueeM8nIGmnNCrLJw2x2vQYAGWuv
	+GQCt75e6rWPDiyi3gQUxfCvC96/RK4SrfHOJFqZ8A==
X-Google-Smtp-Source: AKy350bNDlq8omL6C5VYBvrDpmMp+ZJqXKk9D1arTEZ5Jo48ki+2fH+W9YnpT+A9TVctPNAUkGxRMWzPGLfKS2MSHg0=
X-Received: by 2002:a05:6902:a8e:b0:b6d:1483:bc0f with SMTP id
 cd14-20020a0569020a8e00b00b6d1483bc0fmr1379565ybb.9.1679564112387; Thu, 23
 Mar 2023 02:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <878rgzuw37.fsf@kernel.org> <f08d7310-8c33-ab0b-c9f1-317f737ba37c@linaro.org>
 <87v8ite3g4.fsf@kernel.org>
In-Reply-To: <87v8ite3g4.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 23 Mar 2023 11:35:01 +0200
Message-ID: <CAA8EJppge=2Zf1CZPY4sUNkC2VzhDQ8ah8f3x6LGAky=PdFQrw@mail.gmail.com>
Subject: Re: [PULL linux-firmware] ath10k & ath11k firmware 20230215
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_023516_766804_478F94B8 
X-CRM114-Status: GOOD (  15.44  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Wed, 22 Mar 2023 at 07:54, Kalle Valo <kvalo@kernel.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> >>   ath11k/IPQ5018/hw1.0/Notice.txt          | 4094 ++++++++++++++++++++++++++++++
> >>   ath11k/IPQ5018/hw1.0/board-2.bin         |  Bin 0 -> 524564 bytes
> >>   ath11k/IPQ5018/hw1.0/m3_fw.b00           |  Bin 0 -> 148 bytes
> >>   ath11k/IPQ5018/hw1.0/m3_fw.b01           |  Bin 0 -> 136 bytes
> >>   ath11k/IPQ5018/hw1.0/m3_fw.b02           |  Bin 0 -> 262144 bytes
> >>   ath11k/IPQ5018/hw1.0/m3_fw.flist         |    3 +
> >>   ath11k/IPQ5018/hw1.0/m3_fw.mdt           |  Bin 0 -> 284 bytes
> >>   ath11k/IPQ5018/hw1.0/q6_fw.b00           |  Bin 0 -> 532 bytes
> >>   ath11k/IPQ5018/hw1.0/q6_fw.b01           |  Bin 0 -> 520 bytes
> >>   ath11k/IPQ5018/hw1.0/q6_fw.b02           |  Bin 0 -> 7552 bytes
> >>   ath11k/IPQ5018/hw1.0/q6_fw.b03           |  Bin 0 -> 545008 bytes
> >>   ath11k/IPQ5018/hw1.0/q6_fw.b04           |  Bin 0 -> 86788 bytes
> >>   ath11k/IPQ5018/hw1.0/q6_fw.b05           |  Bin 0 -> 17776 bytes
> >>   ath11k/IPQ5018/hw1.0/q6_fw.b07           |  Bin 0 -> 1488 bytes
> >>   ath11k/IPQ5018/hw1.0/q6_fw.b08           |  Bin 0 -> 4096 bytes
> >>   ath11k/IPQ5018/hw1.0/q6_fw.b09           |  Bin 0 -> 2330624 bytes
> >>   ath11k/IPQ5018/hw1.0/q6_fw.b10           |  Bin 0 -> 269028 bytes
> >>   ath11k/IPQ5018/hw1.0/q6_fw.b11           |  Bin 0 -> 99436 bytes
> >>   ath11k/IPQ5018/hw1.0/q6_fw.b13           |  Bin 0 -> 7024 bytes
> >>   ath11k/IPQ5018/hw1.0/q6_fw.b14           |  Bin 0 -> 1668 bytes
> >>   ath11k/IPQ5018/hw1.0/q6_fw.flist         |   13 +
> >>   ath11k/IPQ5018/hw1.0/q6_fw.mdt           |  Bin 0 -> 1052 bytes
> >
> > For the past several years, the Qualcomm community has been shifting
> > from the pack of .mdt+.bNN files to a single .mbn file as a main
> > firmware file format. It reduces the back-and-forth between the kernel
> > and userspace and also simplifies handling of these files.
> >
> > In-kernel mdt loader provides backwards compatibility, detecting the
> > file type and using .mbn instead of .mdt one, retaining the name (or
> > using symlink).
> >
> > Do you have any plans to also shift from .mdt to .mbn?
>
> I have not heard any such plans but I'll ask around. Would you mind
> filing this to bugzilla as a feature request?

Done, https://bugzilla.kernel.org/show_bug.cgi?id=217235

> https://wireless.wiki.kernel.org/en/users/drivers/ath11k/bugreport
>
> That way it's easier for me to track it.


-- 
With best wishes
Dmitry

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
