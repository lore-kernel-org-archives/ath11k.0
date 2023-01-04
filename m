Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E503CC4708D
	for <ath11k@archiver.kernel.org>; Wed,  4 Jan 2023 02:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8+L8ouRhpOCpwlfNQjUC93wyi3o1BTMZLFI9uLsfNGE=; b=D9aNBBE5ATgdMY
	9QtmGfU1roEXDS8BW3dIaM52Sg9k0A4WLKdJjTLtwERm2qQ6vHtepjj7VIWHPTxzhcd4TfkwTtuts
	lXxi6q0toqQLgkbRkzbVsAisItXqrJK5DYh1UIK/9E4EuO4SHbgLe1ElbOCY8VVR5l/oIDIdAnZgo
	PBbCPQs98NqD6IqYm86OI90t+IUPslZt48oOsMAPdjs9IlEGz6EnUL7Rt9QstEpbcFsZYXYcWRl2h
	wOROBAQR/K0y0jq5igb/6pU+fuwKOrmu6c32AMiPkGyOSyi3CDUrSiSy2/ZiwD/0T/Bt/aF4zIHIE
	Sx58dPCz6XwH48cNaX6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCtjZ-006QEp-PZ; Wed, 04 Jan 2023 02:42:29 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCtj8-006PuN-Ed
	for ath11k@lists.infradead.org; Wed, 04 Jan 2023 02:42:03 +0000
Received: by mail-ej1-x629.google.com with SMTP id tz12so79513189ejc.9
        for <ath11k@lists.infradead.org>; Tue, 03 Jan 2023 18:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DHAdUafUEa2Sx9gsnv6sHrzKEesKIKtSak3NT7xjZvM=;
        b=Dx0nsiXOVjITlpL5wzRH7dIyfnVZW+bdxeSusalAt/y3yH+93OI1ujP6b2Et7OsUqm
         WNhiZ+Spvg+/jiayzUHKDUG1Uc0luV9NIGcMK6R373nCtm0a+AT2UzGcLq7wl0OeetZG
         nvXy91dY0ELofYE/vJbItC38yrvEq2h0ZrJuWlbs65XuP+Z9A4n1/f7jPKZzOdPpkY+y
         ehWcHSFyKGM+7oH/xGjpLmvwiOXs9MbZdWK3jAuANBRP93kRXyv5MxwaViWUC9AtS6sL
         adbMZsNunZ0frBwVe1J95kzJaAj7ZpFGt0qW+ELEmWaNOaX3ALyocygce0h16vkKgdSS
         KfTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DHAdUafUEa2Sx9gsnv6sHrzKEesKIKtSak3NT7xjZvM=;
        b=w7zbKnZVmZPDxtbjhUdc7m4OCboHhH0MUlSqfe2RbIpbnV884M++N9gqZ73Dgh5vg2
         N0jORJtx/2fOUs3iBqJ6sBbbCvl3O8i4QTLSFrTRI3Enza1akHw3fPAts4DkeJXwaKww
         iIJZKvsmkWSJSyn0RE0WGkl3Q/KgO3khnYiuI6qB3847Ib2zOauYZnrP49DgOv2QB2Jy
         n56QCl3dSdgBe1HUtOkgvFKRxVLApXamF4qX5gcs1Q4dBYJoGhoD+UWLrA0ctHa04RZW
         Mh0/zAReOyxHJ5JMc0TuxpYHT88k89VKSKMyz2/7ejdRUEQ/pAUlsmJbNTkRmP9PibdI
         thwA==
X-Gm-Message-State: AFqh2kpeWurWbGqPKaS9w/j4yMTTqhWZWUAuU6+sgB+llhLLRTV5ebVt
	2e5mbruFYO4JbXZSye/mo4DzGU/rrcvbJwB9f1DdrfsDsyE=
X-Google-Smtp-Source: AMrXdXt5ldvQNrNZWPrEm0KHPi/tqeW5PzLvOP2Ef71Jn4Ks7xwZUgRg3QfEheejpxCl8qAYERbcsuAhocIZuhu4O6E=
X-Received: by 2002:a17:906:6a04:b0:803:3f50:a7af with SMTP id
 qw4-20020a1709066a0400b008033f50a7afmr3037932ejc.78.1672800115444; Tue, 03
 Jan 2023 18:41:55 -0800 (PST)
MIME-Version: 1.0
References: <20230104021445.47484-1-quic_bqiang@quicinc.com>
In-Reply-To: <20230104021445.47484-1-quic_bqiang@quicinc.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Tue, 3 Jan 2023 19:41:44 -0700
Message-ID: <CAOCk7NpGBD-2nHFBE3a4WxNb4XPhEV3uoCDz1J9ArbaOE7Vscg@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: host: Change the log levels for SYS_ERR event
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_184202_536232_D2DF6F8F 
X-CRM114-Status: UNSURE (   9.64  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Why was this not sent to the MHI mailing list?

On Tue, Jan 3, 2023 at 7:19 PM Baochen Qiang <quic_bqiang@quicinc.com> wrote:
>
> Currently no log printed when SYS_ERR happens, this makes
> debug quite hard, so change log level to make it noisy.

You are going to need to explain this more.
There are two drivers in the upstream kernel that are MHI clients -
pci_generic and ath11k.
I'm assuming that you care about ath11k because you included that mail list.
In ath11k_mhi_op_status_cb() I see a warning message printed when the
syserr callback is triggered.
I see something similar in pci_generic.

Looks like a log is printed when SYS_ERR happens in all possible
scenarios, so I don't understand the point of this change.
Particularly given that dev_dbg messages can be trivially enabled.

-Jeff

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
