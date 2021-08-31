Return-Path: <SRS0=UKGk=NW=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98546C4320A
	for <ath11k@archiver.kernel.org>; Tue, 31 Aug 2021 10:37:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6754E60F42
	for <ath11k@archiver.kernel.org>; Tue, 31 Aug 2021 10:37:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6754E60F42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oNcpTFizsL4fIGaAh5EHmH09XH+nxcxoGNmav6OYNVk=; b=WT+0X85Wk69409
	3fVB8yRtKfI3ng68s56jy0eVvu3sLM01AfIJqmT3c+ycrzSxec2DjFs+sbQfLxAmXeFr4mzUX43Yg
	n/cBCVdKj379rpeYjpTJjRBwXjpRvCvhRWJ2P2GGIV9uxpVYNfw/H/o+aagIwP4BQYl/wjY81Q7sa
	ufbpD9tPDqSLVRI0Zygl3Qku4M7l/C6ds2jlnqiVJSL3LFKPFJ+O+6OpKDX2j2VA2/JFQhN2faWEg
	wDB98uPLAMqRCe/mJEhYzN6zDD07JaO9KZA3PX9xNf2fwOxWzqH2yznrWA4LQUX7PEzzUVwMzlkjH
	GQ1EGaDL5CNop8ZTDorA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mL198-0023hv-0G; Tue, 31 Aug 2021 10:37:38 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mL191-0023cd-T4
 for ath11k@lists.infradead.org; Tue, 31 Aug 2021 10:37:36 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1630406252; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=qzDTJsu+ue9QOjLN365DiRha10XR/lBgrs4CbIzNUto=;
 b=iNuvG2jMhjym5AY+0j+X2bMuFI236m8ipyXBoLF7CYVs3lhz1N7RFqwnAbylsQHffGB2icbs
 g8xnChKaG0Pq5C1AVbtCJfFdzGKhJjgR4mGiUPxPabRC3Jje2Ud/BrmiKwPVP6iM7m5Y1oUk
 cbaH0NquZ/d3pX+7gSJB7PhcoUU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 612e065f4cd9015037e5449c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 31 Aug 2021 10:37:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id EBB49C43619; Tue, 31 Aug 2021 10:37:18 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1320CC4338F;
 Tue, 31 Aug 2021 10:37:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 1320CC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Nicolas Schichan <nschichan@freebox.fr>
Cc: Jakub Kicinski <kuba@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Wren Turkal <wt@penguintechs.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, regressions@lists.linux.dev,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Hemant Kumar <hemantk@codeaurora.org>, Loic Poulain <loic.poulain@linaro.org>
Subject: Re: [regression] Re: 5.14 rc6 broken for QCA6390 on Dell XPS 13 9310
References: <a8cddf24-ecfc-088e-27f4-98cbbb5fb67c@penguintechs.org>
 <87y28sqq4l.fsf@codeaurora.org>
 <843e7689-fa1e-441b-c49a-ed7291046d5f@freebox.fr>
 <87tujgqcth.fsf@codeaurora.org> <87mtp47073.fsf_-_@codeaurora.org>
 <YSenaxWzxRkYkucv@kroah.com>
 <20210826074850.16768dee@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <87eeag6yjr.fsf@codeaurora.org> <87y28o5cw4.fsf@codeaurora.org>
 <20210826111207.364d0ba5@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <87sfyv5abg.fsf@codeaurora.org>
 <CAHNNwZD2dLC9dWui7kAEg8R04U0LVdQJMJCyugkHA6rdfRwGLQ@mail.gmail.com>
Date: Tue, 31 Aug 2021 13:37:11 +0300
In-Reply-To: <CAHNNwZD2dLC9dWui7kAEg8R04U0LVdQJMJCyugkHA6rdfRwGLQ@mail.gmail.com>
 (Nicolas Schichan's message of "Mon, 30 Aug 2021 18:04:04 +0200")
Message-ID: <87sfyp3noo.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_033732_802137_E4785010 
X-CRM114-Status: GOOD (  14.67  )
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

Nicolas Schichan <nschichan@freebox.fr> writes:

> On Fri, Aug 27, 2021 at 2:41 PM Kalle Valo <kvalo@codeaurora.org> wrote:
>> Jakub Kicinski <kuba@kernel.org> writes:
>> > Done, thank you!
>>
>> Thank you waiting for me :)
>>
>> I just tested commit 7e9965cddea8 from Linus' tree on Dell XPS 13 9310
>> laptop with QCA6390 and ath11k works without problems. So the issue
>> should be solved in the final v5.14 release.
>>
>
> Good evening,
>
> I have tested loading ath11k on v5.14.0 and I can confirm that the
> driver loads fine now, with a phy and wlan interface being created as
> a result.

Great, thanks for testing and letting us know. And espeacially huge
thanks for finding the commit which broke this!

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
