Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F8BEB64DC
	for <ath11k@archiver.kernel.org>; Tue, 11 Jul 2023 08:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lemIPJdt8rZ/DHRAMi3B28mSDYkvtw+g7DikVX2Dtpc=; b=Vz/oN4aD4qZW6e
	/S6YJDdJjs4IVzzHtN4AgMGr4sZYZAFsVJZ5pIpgOr1K8uX/CD0fMiEk+UJIX1XPNthzi36dzIs8f
	yDLe4UgBVhAlVwTK63VBptKXQqHa7eXjNMSYCCsWN1vCaUeXzLdK/F38CXLX5j//6h8rsPyXPc8Wn
	6w4dmMlu+pjsELf89yVxhuIdjyCyBWDKDj6iPh+F9K4gaWNVrhbM40QnLtKrb9DdrlnRaeT7PU9Jz
	ORf/WozYus5pwBix7zUJATWqQMpgivt5EK0fXneeRiXglPksLSry6e0FGJqQCEg67sb4PAlQ8IOco
	8gclWu76TUp47hglIb7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ94L-00EARZ-1u;
	Tue, 11 Jul 2023 08:50:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ94I-00EAQR-1n
	for ath11k@lists.infradead.org;
	Tue, 11 Jul 2023 08:49:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0C19C61368;
	Tue, 11 Jul 2023 08:49:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9F20C433C8;
	Tue, 11 Jul 2023 08:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689065397;
	bh=vnuRFOlbTCDHw/iE3CrCORNC9hq7UhjCf0ZkcUmXb0g=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=can97JGF/+W+A6Jqu7kyCbGB64KNuVx0LfpxfiEcb/sv0CJBmXQPZWwB1j41iBt/R
	 CsCF2LOIut13qo7jbqEJv+0fIR+Y+h6ZQ7orPadlsUdYFNCOoBY+VJoJgjwC1yT+7+
	 xWQ5OjadJxqMWNsNLjfgIVzlM6dCDx+wzoXNmE9NGg8vYAfLJ7CSwIHOJZ2d9Yhrv4
	 8R8eLLcZpzZ8eynj88R/DFFhEvDE6DcrmLQ2HOSC+/EBpujK7fJXlVva//NAZBm1FB
	 m2QwIBIOXZDaWxz2vPRfRau79+OWMc5BVhal4+qlXzdVQZTRIk/bbba1eszv62Z3zQ
	 KPcJFCJ5G3SjQ==
From: Kalle Valo <kvalo@kernel.org>
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: <ath11k@lists.infradead.org>
Subject: Re: ath11k: BigEndian platform support?
References: <68290980-5bfb-c88c-be78-954f9591c135@westermo.com>
Date: Tue, 11 Jul 2023 11:49:54 +0300
In-Reply-To: <68290980-5bfb-c88c-be78-954f9591c135@westermo.com> (Alexander
	Wilhelm's message of "Thu, 29 Jun 2023 11:50:03 +0200")
Message-ID: <87cz0y96j1.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_014958_638375_1A437DA6 
X-CRM114-Status: GOOD (  14.39  )
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

Alexander Wilhelm <alexander.wilhelm@westermo.com> writes:

> I am trying to get the QCN9074 module to work on a BigEndian PowerPC
> platform. My question would be, has anyone done it yet? If not, what
> kind of effort would you estimate for porting or are there any
> firmware limitations?

This is a good question. The short answer is that it _might_ work with
QCN9074 but AFAIK nobody has tested it and I'm not really optimistic.

The long answer is that the big endian support in ath11k is implemented
in a weird way which I regret big time. The idea is that the firmware
does the translation instead of ath11k driver with this flag:

/* Host software's Copy Engine configuration. */
#ifdef __BIG_ENDIAN
#define CE_ATTR_FLAGS CE_ATTR_BYTE_SWAP_DATA
#else
#define CE_ATTR_FLAGS 0
#endif

But later I was told that not all firmware branches actually support
this feature, sigh. To my knowledge QCA6390 and WCN6855 firmwares do not
support this CE_ATTR_BYTE_SWAP_DATA but I'm hoping QCN9074 firmware
would support it. Grep for BIG_ENDIAN to see more big endian specific
changes.

In ath12k the endian support was implemented in a proper way using
__le32 type family and cpu_to_le32() & co macros, but it's also
untested. It's on my todo list to convert ath11k to do the same but no
idea when I'm able to work on it. Patches very welcome.

Do let me know if you test ath11k on big endian, I'm very curious to
know the results.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
