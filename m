Return-Path: <SRS0=Dsd9=FU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	TRACKER_ID,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4842DC4361B
	for <ath11k@archiver.kernel.org>; Wed, 16 Dec 2020 05:41:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E50A823123
	for <ath11k@archiver.kernel.org>; Wed, 16 Dec 2020 05:41:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E50A823123
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cUwf7XJnDvATWYCNAkmYhFoUuM/9HPLcTlp21Z7Q+ro=; b=c90SAukHEBjyR+0WPnuHLk5xs
	tO1a8YpedjrtT3o0hO5WiUe719CM1OT2GRVaUrLOjpgBrQhuWV/4kSWnyInhgUNyoCeWRpnth9k9w
	Nw1zZSBf2++jwvageZPBCxqlKXZ4/fZJjuofc6bglzPt9pkGwPLa3fYmW06GfW0I+yVdPGPH7KAdq
	I1brj7DOHY0QwqYe2BHBy1YzkgGgatsc8t0wh07jsyIeWuSqgW1rgRForGlIxoP8VfzYroJNruATD
	Gp05fLNVRuK2Trrd0Q+pR7iDb2bXUmwLan8Q/d6MWZD1Ckrhn3K2lXNaSZRJ0oLhfOHiyoO1+J7AR
	WTVvLwIUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpPYv-0000Vn-DB; Wed, 16 Dec 2020 05:41:21 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpPYs-0000VG-J4
 for ath11k@lists.infradead.org; Wed, 16 Dec 2020 05:41:19 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2so15905791pfq.5
 for <ath11k@lists.infradead.org>; Tue, 15 Dec 2020 21:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X0HIKYeScc2vyJWZWSPjJLiARJWHVkKcHistAZIO0ho=;
 b=KB1oehUui34CHq55zhpZVAaXZyGBeq5Ed0rcapLLmmeCBUO7MFCo9KxWkzjnPxWkJK
 aAaogL42jsuoMpMIxkia0/x2ezG8BvBEMn94epPmc9yi6E1UgrbApg9NJLlkdrcb1wR+
 tuj6F52nfJ8SQEl0HEtrNp7OdCHkJI2wA0X7e8Tk+ob2DoF/UTuVwKB6CSH+xrtjD8kj
 m0g5K0dizugf+lfKrdLnzMdQPSPfGGwRek4VFL8S3B5Et1/PaG3M5PaduAf0iKVYDcx+
 kwWBDSrOqM9RUUbxWVxUx22UlMI2kMJgdukmbjr5W28Xet17AQ9BNo5Eg+qF68C/zr5u
 B16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X0HIKYeScc2vyJWZWSPjJLiARJWHVkKcHistAZIO0ho=;
 b=ZMyCxKkOZz+7IhiBN6aTb1c51lOwhk0MV51i8w4g2INzv5Fpmkly0NEvfHWp7l0xkh
 Sa6dZIAR+fKjIw+Z25W4JMX5yH+9/PErQgz0QV5YiWuh5XrpcK8PPlk6VXrSFrai9D4P
 2ttPRQMkKCno8HO8AGf4BM4nMGDyqlOGJAMVQ1NEYqX2EQYiZQdoiVClcn9J00GZyxm4
 ap1k9yycmR+ndq19+4SSLuLWF2noAJ188+za3Mkvn/IMEjG61WE0MmNuWOCqVW+oVz/M
 veO6io2TLySy31wSc/pYzjlXpnIsjQ3EZsMxNx3qTwnkZN0rZtax9db3Vy+F7SfN+t5J
 Suyg==
X-Gm-Message-State: AOAM532iQ6VNJMTVm5NiWonavGPCjSjM91HILumsOntXwyx9qTi7y0T7
 pnEGTkx84EptQc/UC09aJQnFCpPIWnhe5+ft1oA=
X-Google-Smtp-Source: ABdhPJwyYAWR6csrxJ98N2FgxePrgBdTcj6BlwrRs/GFk8TamXEZpMcK1tMgN7n4kmOEB1FczBmrlalikB1Mit+Uq60=
X-Received: by 2002:a05:6a00:22c9:b029:198:15b2:bbd3 with SMTP id
 f9-20020a056a0022c9b029019815b2bbd3mr31100325pfj.64.1608097274766; Tue, 15
 Dec 2020 21:41:14 -0800 (PST)
MIME-Version: 1.0
References: <87blew3e4q.fsf@codeaurora.org>
 <CAHUdJJXFyNxbf7nBGxw+dsMswcVoxwbQ73U=9=3o+zM7p7kpHg@mail.gmail.com>
In-Reply-To: <CAHUdJJXFyNxbf7nBGxw+dsMswcVoxwbQ73U=9=3o+zM7p7kpHg@mail.gmail.com>
From: Stephen Liang <stephenliang7@gmail.com>
Date: Tue, 15 Dec 2020 21:41:03 -0800
Message-ID: <CAE+mCOEavJkcsgBvLR1z=kLUEwW9jJzVvi7hoxVrkBYj=pwKSQ@mail.gmail.com>
Subject: Re: ath11k-qca6390-bringup-202012140938: rebate to v5.10 and MHI M2
 workaround
To: wi nk <wink@technolu.st>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_004118_663818_DFC629A9 
X-CRM114-Status: UNSURE (   7.56  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Uptime has been very good so far at 24 hours, no hangs. I did see a
backtrace when associating with a different AP, please see:
https://pastebin.com/raw/5VTAK1mp

This backtrace does not appear to affect functionality and the AP
associates just fine.

Speedtest.net is giving me 340 mbps down / 185 mbps up, so very good
throughput. I can do a LAN iperf throughput test later on as well if
there's interest.

> * name of the bringup branch tag you used

ath11k-qca6390-bringup-202012140938

> * if there are other changes in the kernel, patches, reverts etc

Clean copy of Fedora rawhide kernel 5.10.0-0.rc6.20201202git509a15421674.91

> * do you use the memmap kernel parameter

No

> * make and model of the laptop/computer (eg. Dell XPS 13 9310)

Dell XPS 9310

> * how much testing you did

Mixed usage, suspend, wake, charge, discharge, etc. WiFi network
disassociate and associate, etc.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
