Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2688C47077
	for <ath11k@archiver.kernel.org>; Thu, 11 Jan 2024 08:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pn6FFwOYyKWpSsi3PhJOQymtBwtHM8IEqVHJUsCejxE=; b=Ynbal+1Ph0kwquR2UX1t76GWdl
	wASRjMy75iX2eR39fv745Tm21zhO22oe9Ke0oL0IHj+rwBLxO8+scNPHW9uY/RcNJZyZxIubv77i2
	Ergwgc8DpFYdDKUVxc0p3K18NnjH967A3G9tY4ACDqnjFkfPax+ig/oqi9CEGFKfzD9bB3gOIlbcG
	edyNTd75xRfwr3Fz+/FYjNekjRNd5YgYFie6miqQgEq/dcWS9kCMQPFUy9gF3uvbPiVTR/p2ENLkH
	oBkTp2vGhlPjb+Cics5ZGieSk56lJPJGrEX9gT53fCpCWrmiRMTbCPRQfMxO1j+ZqLyLZMMfFJm4C
	kLcy1TKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNqEa-00GS12-1z;
	Thu, 11 Jan 2024 08:16:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNqEX-00GRy1-1B
	for ath11k@lists.infradead.org;
	Thu, 11 Jan 2024 08:16:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8F9A7618F2;
	Thu, 11 Jan 2024 08:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4434FC433C7;
	Thu, 11 Jan 2024 08:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704960972;
	bh=BQudpe0VwbbOvUlPTJMdiM4Iwq5AM8cdBJqebzL7SxY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=RX+tTMYGZYyxemfO6jVBFJaiVmtcP84X0vzY+FE33UP/89hqvrALUF2VHhn5VwpUQ
	 zSfVhFGazTHowBn7Ozy67iKb6tdaDgbpIfTiRcHZWqWRzckrIR1SgI47C5dFdvQ0bN
	 WRjxCxws63Q6xJgx1KaTZZ0C8lMtHPTMI2nXDB1xN1VOF83e5VbFsiDdp9X5y40FHU
	 jVnx7emlDt+0a3EjhKcxYnZXlp0LcQWtFS+1JKMn3hSp3eTMZYJZOzzYwso4nu/n6+
	 1JC5R1z4enWFsJoueq1ftRsh6D7/jA8p9fvS1NR2stmipCVwHhQcHgAracGGn73Zcx
	 fXH+RNNnwcTHA==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: James Prestwood <prestwoj@gmail.com>,  <linux-wireless@vger.kernel.org>,
  <ath11k@lists.infradead.org>
Subject: Re: ath11k and vfio-pci support
References: <adcb785e-4dc7-4c4a-b341-d53b72e13467@gmail.com>
	<8734v5zhol.fsf@kernel.org>
	<87fa5220-6fd9-433d-879b-c55ac67a0748@gmail.com>
	<87r0ipcn7j.fsf@kernel.org>
	<356e0b05-f396-4ad7-9b29-c492b54af834@gmail.com>
	<26119c3f-9012-47bb-948e-7e976d4773a7@quicinc.com>
Date: Thu, 11 Jan 2024 10:16:09 +0200
In-Reply-To: <26119c3f-9012-47bb-948e-7e976d4773a7@quicinc.com> (Baochen
	Qiang's message of "Thu, 11 Jan 2024 11:51:44 +0800")
Message-ID: <87mstccmk6.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_001613_450239_223B8C17 
X-CRM114-Status: GOOD (  13.42  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> On 1/10/2024 10:55 PM, James Prestwood wrote:
>> Hi Kalle,
>> On 1/10/24 5:49 AM, Kalle Valo wrote:
>>> James Prestwood <prestwoj@gmail.com> writes:
>>>
>>>>> But I have also no idea what is causing this, I guess we are doing
>>>>> something wrong with the PCI communication? That reminds me, you could
>>>>> try this in case that helps:
>>>>>
>>>>> https://patchwork.kernel.org/project/linux-wireless/patch/20231212031914.47339-1-imguzh@gmail.com/
>>>>
>>>> Heh, I saw this pop up a day after I sent this and was wondering. Is
>>>> this something I'd need on the host kernel, guest, or both?
>>>
>>> On the guest where ath11k is running. I'm not optimistic that this would
>>> solve your issue, I suspect there can be also other bugs, but good to
>>> know if the patch changes anything.
>>
>> Looks the same here, didn't seem to change anything based on the
>> kernel logs.
>> 
> Could you try this?
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/net/wireless/ath/ath11k/pci.c?id=39564b475ac5a589e6c22c43a08cbd283c295d2c

This reminds me, I assumed James was testing with ath.git master branch
(which has that commit) but I never checked that. So for testing please
always use the master branch to get the latest and greatest ath11k:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/

There's a quite long delay from ath.git to official releases.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

