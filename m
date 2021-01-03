Return-Path: <SRS0=czDI=GG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA79C433E0
	for <ath11k@archiver.kernel.org>; Sun,  3 Jan 2021 00:35:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FE0D207A5
	for <ath11k@archiver.kernel.org>; Sun,  3 Jan 2021 00:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FE0D207A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7qGyodK7gyK90ZqHJHmYferb3MSPVYJKVjsPVMcdjsU=; b=jG5Y9G8aj5f1Qf10/d8WixzSM
	yMjL8S4loc1lw1ONUE8blCnrexerrJob6yNFBD9ij1ochI8f9Ijt4VFnubf5yh5KOa54nixyMKRJE
	EpPrIbnZhrNKlZ/8/GOO9VZKEi7SPq1wHThCJS+IfOkIdX9XsN1jxiwRBVi0VK7nA2ji5OkChdHET
	xsRC0hdFmTkVzAJx4SIT/Kk666PcCwy7xaShbAVVhwWAFNaWtzn420zhPgYc1zeBhuzTZNnQGABnA
	7omHNHFy+PACCS2Ku3p/yHEuutYvgS1f0OPWZixE5u4RC0E9SmT/H5dlVRDrYOEE6J5K+C/lmrpdn
	eqLZYKcvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kvrMP-00039X-4t; Sun, 03 Jan 2021 00:35:05 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kvrM3-00032A-9H
 for ath11k@lists.infradead.org; Sun, 03 Jan 2021 00:34:44 +0000
Received: by mail-il1-x134.google.com with SMTP id v3so22047987ilo.5
 for <ath11k@lists.infradead.org>; Sat, 02 Jan 2021 16:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=J585tB89NAC6zlB2wCXSJ5KsBBZdSORzdVLWSqsnFkw=;
 b=aH8vOft6qZlQ7pky2wyoKNzH5FnkKVu1TxSX3Oe064ug0vlSsykNEIJATTOxYdiCfd
 f1F5YoXh0Wrn8C70kum+VQMkdOCNLAucZmiRi3g+HnxCFs/0WVdPUppkKqNSWnrcoOR8
 IzvE8IKWfuCApDDRJndLV8z+11Rd15Ogo5rLWA6chmlR3/ZQkeAjTyxP3DVSvc9XLeux
 vlq8I/osNGTosRCY6kzR8lquxS0wuvAsrqjXpYZ8Ue84haICXkZW9vdJgSn/IHaBDF2E
 GTKKQ0jZgLmHR05ncObmOoQrAPYmairQ7Y5ZRUBX3Y6ivGJxxrd3LbiuCgGX1xNz43L+
 f8uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=J585tB89NAC6zlB2wCXSJ5KsBBZdSORzdVLWSqsnFkw=;
 b=UZg4nOy/tdVrFaiZLbZGG2Kxb0XBRc2nbWHIdvaxDr8kHLmuMlHXApwKSumQShj6Wx
 Q13o8s1RL+koBjcaRP9t2Q2UQlLvkcHapt04jJtj8A8hUnP2CXq37dA6IqIK9iABwsN/
 7U+5OLoJnRHANHa/sjoPLBq2b1ale7QPK99DRAUHtGeNYiYfieU7KxuYA4R2mBnSHuBa
 0ydZK3WzKm7syUaGsTtcXB/Fu8kMrfT8JKa1+N5GL2DzanEO3d5VM3+mrDxc/YkKpXim
 zWd3kt1Zb5slu7Cd/Fk9os20nsq4p826PpJpeaNPDOJN8PfDI0/Yx7gRDoHIfrktkBlx
 mPIg==
X-Gm-Message-State: AOAM5319t7832+1ojpWQeSphmYf455OSr+aEIDu/sHTnZblKkqgqKhzO
 Tlx83XIehwueZ95CD/4U63YykXBtkRsPWhB0gCQ=
X-Google-Smtp-Source: ABdhPJyyU+jp75cC9KADq49h0lSF90zILan6+jJ0M11n1aIDUvhz+UcnWo5zAo7x9/pUYc6Rfu2SnOsU60ZwCJJj9cg=
X-Received: by 2002:a92:dc03:: with SMTP id t3mr66874065iln.215.1609634080555; 
 Sat, 02 Jan 2021 16:34:40 -0800 (PST)
MIME-Version: 1.0
References: <CAM+r-RhxY4TA4zPm6e6ah9RWdBY67J=5oRS3+=+EQMomKa10QQ@mail.gmail.com>
 <CA+icZUWcuka-6j139+89pSV5Z-r1fYVriz+wJE0gma4RO_PL9Q@mail.gmail.com>
 <CAM+r-Rj3y6DGonMPQ_V7qCwWH7v1bgh5x7YmAzMh5-cY68jJiw@mail.gmail.com>
In-Reply-To: <CAM+r-Rj3y6DGonMPQ_V7qCwWH7v1bgh5x7YmAzMh5-cY68jJiw@mail.gmail.com>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sun, 3 Jan 2021 01:34:28 +0100
Message-ID: <CA+icZUXkwN=WT+hOop2WjwdVOp8UB93XKd07KB_EdCP5U_znsg@mail.gmail.com>
Subject: Re: [BUG] Stacktrace in ath11k_pci
To: Luca Versari <veluca93@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210102_193443_754111_A7B17B96 
X-CRM114-Status: UNSURE (   7.80  )
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
Reply-To: sedat.dilek@gmail.com
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Sun, Jan 3, 2021 at 1:18 AM Luca Versari <veluca93@gmail.com> wrote:
>
> Thanks for the quick reply!
> Unfortunately, this didn't seem to work - I'm still getting the same
> stack trace:
>

Latest ath11k firmware?

- Sedat -

[1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/ath11k

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
