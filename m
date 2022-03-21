Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B118BC433FE
	for <ath11k@archiver.kernel.org>; Mon, 21 Mar 2022 11:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RByujdsCkI3jByqaDg1YdkCllAo+vJOhBNbKLHfp27E=; b=NyP1d+dRamKzHM
	+6WyBx/ouLjgtYGI5tamRmo4Acj/9sl9jRKHE9nVgWskG/UhblAlaizby6QrtQkEDU4on38ZViVVC
	i0i/LFfiBPdxiDH+2OCeM66Zcx7aUgA/p54qyhJfDnogb7384FN48gsYVnDPaQIirBIyND78MubZ5
	fyQNaol1r/IWWtEQ1Y/vuEhbQ++YLmCJX9Dg1JGVPFg/OMBO1QAI+TtN8L8Uyf1DICKQnjy4uVzus
	2G1hNR+uFh87VW7spga/PbVWwaW4HyswYIEJBitsCHqTMskqK/ckC0RX1+Vf6YFNnyeAolQ3CWPSB
	dhIIAYCJmJbegC+Jf0yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWGLU-007Ss8-8u; Mon, 21 Mar 2022 11:37:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWGLR-007SrX-4F
 for ath11k@lists.infradead.org; Mon, 21 Mar 2022 11:37:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A32CA60C47;
 Mon, 21 Mar 2022 11:37:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D60C340E8;
 Mon, 21 Mar 2022 11:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647862624;
 bh=PaASJY+h4nIV4WWZGWDHE04GtTCVUpLBUwvWYidELRg=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=a1yhIgYx67i/n4B+GRey7oXrtayTHvljIR70wVp3n3SkrkekGXUCydvSDDM0ObHne
 GUNlvzjcsT4RvOY8WCPiOkrJuj9BX5aXc/CCmsNaDuXyckuFbDEs5ZHF1ow10/ewma
 OpF1IhDAZ1+m1zPHicWAv2YsJV5u+cgvxvq4CrRBlmvs8oX9O5HxKNUjpMHECXa5Et
 husoFjeB4GiEFjXIXgLxBDD94/0z/JHxU/g3j1cAXxH29vFKsbDD9Ste008ql0fUxh
 1W0ygOCmubp0+LlxQX84Pp7A5V6Ifba1AdoFOrIpdENwiPe8gi/LKv6Ty9x8tafP+6
 YQP1bb+gR15bw==
From: Kalle Valo <kvalo@kernel.org>
To: <Daniel.Shen@infineon.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2] ath11k: Add support for SAR
References: <20220321022231.268197-1-quic_bqiang@quicinc.com>
 <164785670143.6138.10862194405307750688.kvalo@kernel.org>
 <af9924aaa82b4622bee872c47fdf88a8@infineon.com>
Date: Mon, 21 Mar 2022 13:36:59 +0200
In-Reply-To: <af9924aaa82b4622bee872c47fdf88a8@infineon.com> (Daniel Shen's
 message of "Mon, 21 Mar 2022 11:29:14 +0000")
Message-ID: <87lex3mt9g.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_043705_507583_7649B994 
X-CRM114-Status: GOOD (  10.07  )
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

<Daniel.Shen@infineon.com> writes:

> I think I am not the right person you would like to send this email.
> Please check it, I received a great many of emails. 

ath11k and linux-wireless are public mailing lists, at some point you
must have subscribed yourself to either of the lists. If you don't want
to be part of the list you can unsubscribe by your own. I'm guessing you
are in ath11k list so for that list you can unsubscribe here:

http://lists.infradead.org/mailman/listinfo/ath11k

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
