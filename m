Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB22FC2BD09
	for <ath11k@archiver.kernel.org>; Thu, 27 Jun 2024 21:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=drGk+Cd9nuycrtt85ykYY1qVKdYzc44FGA/s5LE6WNU=; b=buurthDoL1+GssOvdqlyrTK0KE
	4PTL51DFI8u+3q1geMTnPzgPRCD4zMar67lhj58DvAyRIXn9MYdxDyWe0P3vK4bVvkqVGa/ztisFr
	YF6QQkhcK8Ms/WcBZam+FmUdPXwsiETUAckVJYMqlnZC197Z+sooZRcoxMpbZ+7svaYBceOf05Uqm
	txxDWJDIiN2SuiTZQ8ZOjhtn28Fhc+1IAkSGj6lQEOQGIOmWFIKS2Qz/DZ7NabFAYZEeYZvjfP2Kk
	+QhpFpJxRrNwAXB1QWSsTOhZWlHtByJMGnSrdVaollm8hAmgcMJimQuJ9YlhoPfm5OPK6lMkyWUNL
	lLGpV0KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMwF9-0000000BiEc-2Yh7;
	Thu, 27 Jun 2024 21:01:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMwF5-0000000BiE4-2m1I
	for ath11k@lists.infradead.org;
	Thu, 27 Jun 2024 21:01:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D7F4F62009;
	Thu, 27 Jun 2024 21:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C988C2BBFC;
	Thu, 27 Jun 2024 21:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719522078;
	bh=D18wy75oZodZsi/i1RVrFgy1DPcVSoFWVimvYoS99MM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=e7F3EzDw0MoMeL0hQHtkv+y6g6Pqxw9xhU15OYeOVXlpb1cGgNmfeBeLGdeVTB1SL
	 XG6oXy6abKIyPU2wdzS/Kyn2wKfj3xmZAUkQ2m8akGaYvfXYzrBloZ9+bPDPIPZecP
	 EimZ2ktYVBMNI0VVqg3jkVWCITcZXPK25ZwDOg9KHE+ZTATdZjGdHV0a7Sf22FdC73
	 FN0qvoLl6TogsNVsV0zRekAzakp7iagw3fgU7zTH6evVXYnPOdNcSU8cQCcDnWTRhH
	 HGa4qb/TSEK9ezSuJfzLf46Omk3z9JCN7vXyOkKFlHH5G3SO9jWioenB4Jpz/zmiXi
	 WmZRvLivRVNug==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kang Yang <quic_kangyang@quicinc.com>,  <ath11k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath11k: use work queue to process beacon tx event
References: <20240626053543.1946-1-quic_kangyang@quicinc.com>
	<1e69ca99-fb08-4c44-93d8-33689ff62aca@quicinc.com>
Date: Fri, 28 Jun 2024 00:01:15 +0300
In-Reply-To: <1e69ca99-fb08-4c44-93d8-33689ff62aca@quicinc.com> (Jeff
	Johnson's message of "Thu, 27 Jun 2024 12:24:24 -0700")
Message-ID: <875xtugkx0.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_140119_775816_D8A1BA06 
X-CRM114-Status: UNSURE (   8.43  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 6/25/2024 10:35 PM, Kang Yang wrote:
>
>> Commit 3a415daa3e8b ("wifi: ath11k: add P2P IE in beacon template")
>> from Feb 28, 2024 (linux-next), leads to the following Smatch static
>> checker warning:
>>=20
>> drivers/net/wireless/ath/ath11k/wmi.c:1742 ath11k_wmi_p2p_go_bcn_ie()
>> warn: sleeping in atomic context
>>=20
>> The reason is that ath11k_bcn_tx_status_event() will directly call might
>> sleep function ath11k_wmi_cmd_send() during RCU read-side critical
>> sections. The call trace is like:
>>=20
>> ath11k_bcn_tx_status_event()
>> -> rcu_read_lock()
>> -> ath11k_mac_bcn_tx_event()
>> 	-> ath11k_mac_setup_bcn_tmpl()
>> 	=E2=80=A6=E2=80=A6
>> 		-> ath11k_wmi_bcn_tmpl()
>> 			-> ath11k_wmi_cmd_send()
>> -> rcu_read_unlock()
>>=20
>> Commit 886433a98425 ("ath11k: add support for BSS color change") added t=
he
>> ath11k_mac_bcn_tx_event(), commit 01e782c89108 ("ath11k: fix warning
>> of RCU usage for ath11k_mac_get_arvif_by_vdev_id()") added the RCU lock
>> to avoid warning but also introduced this BUG.
>>=20
>> Use work queue to avoid directly calling ath11k_mac_bcn_tx_event()
>> during RCU critical sections. No need to worry the deletion of vif.
>
> comment nit:
> s/worry the deletion of vif. Because/worry about the deletion of vif beca=
use/
>
> Kalle can apply this to pending

Yup, fixed.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

