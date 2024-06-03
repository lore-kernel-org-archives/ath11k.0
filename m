Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA3AC25B76
	for <ath11k@archiver.kernel.org>; Mon,  3 Jun 2024 20:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JZLwlRnQfdO3ImOJrKNYmzEqxHi09ftcOGFarQS9k0c=; b=JZnNR6WtBm5me8B9w1Ahp9czIR
	WbX/5zO2XDEe/kBKiXNZcXahKG6y8xZ+P46pTk1h5URuq73W1ij9RIK2VsRCE0LUB3MpXAdIyMSml
	xPTYvF8HUKCnGks5qeRNYZLm1JhaEZC/4Gu1XEPFR77WWML7BUiRvN77qfItict+n+fLUKN/inJ+5
	IGHlXVbTMgAaRGX/fRsBouys6BwbMFgQVd60ds4MZDMg4mu0gWMeXUuohP7l9MVpABapL1CxW+Agv
	fdkXqhgkRjFo1kXXKe78DKgD7XrOQoc/MdHQViWdI8MUUp0OLN1XVG8qOHreZEvyAZngVb5l9SeTo
	KpDPQbYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEE2J-00000000Gf9-3S4j;
	Mon, 03 Jun 2024 20:12:07 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEE2B-00000000Gcl-3mVm;
	Mon, 03 Jun 2024 20:12:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D37F8CE0F25;
	Mon,  3 Jun 2024 20:11:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E21E3C32782;
	Mon,  3 Jun 2024 20:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717445517;
	bh=pGZR0EvHvDWqai8PBnHLS0nBSNBDYKCqGmU8d6NkPs8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=frAxb16dDKVqKH15L+a8G2eMgz0PUmxfu47KRyVDx4wjhqL3GSYW2/oWTq7ujcrXo
	 tftIRnzqqCMgpENwVgx7CV7by3XOPtAS5s8icqkviZRnl9MI/Uud1clY0ZIAV80iUL
	 aNWjkLJmC3wqKFosgbioz0JB1b54FvQbLwLnqjEey+gD8WvEi2pXpgDuhmEuo3aMtm
	 ocL8m/LjE3oD1X25As62D18M+emV7lhlC5N2WqsWXbvgmPryEE7uwM/o/3mqHKZ1lw
	 DWD6uUmpr9Odku+gtDR9DKPxl2JFo0EsL47TYAXZYIlGBkyRhhbKVnNGXDt4UjmhPb
	 tthHQidiL3WGw==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: ath10k <ath10k@lists.infradead.org>,  ath11k
 <ath11k@lists.infradead.org>,  ath12k <ath12k@lists.infradead.org>,
  linux-wireless <linux-wireless@vger.kernel.org>
Subject: Re: New staging repos for ath1*k firmware
References: <bac97f31-4a70-4c4c-8179-4ede0b32f869@quicinc.com>
	<878r09gfzv.fsf@kernel.org>
Date: Mon, 03 Jun 2024 23:11:53 +0300
In-Reply-To: <878r09gfzv.fsf@kernel.org> (Kalle Valo's message of "Fri, 17 May
	2024 08:32:52 +0300")
Message-ID: <87ed9dn5va.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_131200_517970_9A66648E 
X-CRM114-Status: GOOD (  13.98  )
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

Kalle Valo <kvalo@kernel.org> writes:

> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>
>> Historically, prior to being incorporated into the linux-firmware
>> project, firmware for kernel.org ath1*k drivers has been first published
>> to Kalle's GitHub:
>> https://github.com/kvalo/ath10k-firmware
>> https://github.com/kvalo/ath11k-firmware
>> (ath12k firmware was pushed to the ath11k-firmware repo on a temporary
>> basis in anticipation of this move)
>>
>> But in order to have repos with multiple maintainers, as well as to have
>> a hosting platform with more control, we have moved to CodeLinaro:
>> https://git.codelinaro.org/clo/ath-firmware/ath10k-firmware
>> https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware
>> https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware
>>
>> Note that most people should not care about this -- normally you should
>> use the firmware that is in the official linux-firmware repo:
>> https://git.kernel.org/cgit/linux/kernel/git/firmware/linux-firmware.git/
>>
>> You should only need to access the staging repos if you need a previous
>> version to work around an issue, or if you are testing new firmware that
>> is supposed to fix a problem that you've reported.
>>
>> Please let Kalle & I know if you have any issues with these new repos!
>
> The final reminder that the github.com repositories will be deleted in
> two weeks. If someone is still using them switch to the new
> git.codelinaro.org location NOW.

And github.com repos are gone now.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

