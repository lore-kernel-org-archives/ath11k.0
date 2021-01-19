Return-Path: <SRS0=8Utr=GW=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_ALL,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB627C433DB
	for <ath11k@archiver.kernel.org>; Tue, 19 Jan 2021 15:56:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9BD4208E4
	for <ath11k@archiver.kernel.org>; Tue, 19 Jan 2021 15:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9BD4208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=narfation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X1Wr0ViahH0R1X+8smMj/kDvK85IcfHAA+Ws4b3QdnM=; b=wq7MEanqvyxhaxDu4ArzsP9Y1d
	Q5Ah/FKkQRYlIMlgNN3iUM1Xjmm8DBbgNDtvyBb7Q7mcClpnOX9Y08GwZNs3DZO3/6RO1ec7VmqJ/
	sfW8LlWDtIetbTsHIfx9iFOgq5ELw+qmhz17cPKKyk0yIDgNWUfzYfFLfEoaCCAAlWJn8H9hB6uEv
	TEl16CEryVbUnrm90LwxOW2WYoqmbbz5327uoPozDAVnEOzQObPgU6PHWI1UTlsJG1iRsD+VEcjTG
	0eynKaH+i9CppdVZqiI6lAEKzHyQDelrL0LyQ9pM6BV5t4twKOqrpQOEpXvXTZimxSOc2DD83ee59
	BryYiSKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1tN5-0006S6-Ba; Tue, 19 Jan 2021 15:56:43 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1tN2-0006QX-Ub
 for ath11k@lists.infradead.org; Tue, 19 Jan 2021 15:56:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1611071799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J0EeON1VLipgM+OFbrWo8/GzsNL3uflJtDURi/fEgSY=;
 b=yA/1A31D2aBoSXc7O1GC6nfAXK/sd6iXWJG2VzEK1vpjUmdAB2NvLaG/EroxSXW2LFfxBJ
 sgnHz3T2wDnPE+jHzJ6fsKPkmZQp+7KMbJB6uNhK3HxXODQ8YM9ysD/AJ1FgM7kjRfoVFl
 +1m9zuO++Kdr1T9K34yZtv9BmnOm8MY=
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org
Subject: Re: IPQ8074: hw2.0: Wrong mac address for 2.4GHz PHY with firmware
 2.5.0.1.r1-00004
Date: Tue, 19 Jan 2021 16:56:36 +0100
Message-ID: <15799786.0ZKypZ73Fx@ripper>
In-Reply-To: <12396947.EVyyLHbfrO@ripper>
References: <12396947.EVyyLHbfrO@ripper>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_105641_152321_1CDA660A 
X-CRM114-Status: UNSURE (   4.99  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Monday, 18 January 2021 09:14:54 CET Sven Eckelmann wrote:
>    /sys/class/ieee80211/phy0/macaddress:f8:d9:b8:2e:36:c4 (ath10k)
>    /sys/class/ieee80211/phy1/macaddress:f8:d9:b8:2e:36:d0
>    /sys/class/ieee80211/phy2/macaddress:f8:d9:b8:2e:37:c8

There is a typo in the first list. The last mac should be f8:d9:b8:2e:36:c8. 
Mixed it up while copying stuff around for the mail. It was mentioned 
correctly at the end of the original mail.

Sorry

Kind regards,
	Sven



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
