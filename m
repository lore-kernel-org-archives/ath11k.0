Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91E3C4332F
	for <ath11k@archiver.kernel.org>; Tue, 11 Oct 2022 04:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ROZHc/AGKGm/QTFLBZ6l4NCpfA+hgwvJY+pe835ot4=; b=AcBLj4Do1ox/Sr
	NXwXM/fJO3Vr0uiDwEzum+XO2vk1L3C/3TojpyBiGDbE8Ryi8Bd85sxqHsVYmUGxz6M6OY8EO1Ueb
	tQJFSDCJQS3UbnY11bDgULEjHmiQbRzZfOJwa+ykTvfye6mASyWVt/EKS5eNPSWKIo3DpQsONqnyg
	t+9ZMzzAueevIYKuIuDP5TauqdiZESADcCmVNXJOVF3ZcAN5owR3+qontLIAVeyFzKd00wOimctFY
	m85bivSZhxsXa8VC674tB8MzqOUq+ZqdbHu0hd+sPE1sgQ+3pAxkwff5FjPncKoqXF0ftO9Zef/Qf
	Vgbv0q+H4W2Xq4hXybhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi6vI-003G0U-CF; Tue, 11 Oct 2022 04:31:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi6vF-003G06-3L
	for ath11k@lists.infradead.org; Tue, 11 Oct 2022 04:31:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 583D660FB8;
	Tue, 11 Oct 2022 04:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2180C433D6;
	Tue, 11 Oct 2022 04:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665462675;
	bh=eTCW46MHQduaWM8HF4jpZS4margqI5deX1yNarhMF9k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=n4rI2GD7ZIhshWuYwRr3clbBsv9AO1puTKiLcyxIVv9Pl0EYlQtUOnoaBhkWNrcGH
	 o25Budunrw3Xzh/03Fj7hGr46obPkjAP+UiA9Wxw2YCOaf+bKIt7ltAmqsfzQKUPrI
	 buDXpeGqPEfDAgwQ7tsZSp/Ef/lm591NTKANy+NyC08iUiAepn7/CFo0BMh6I4+cTX
	 KfYBuvPE8dtz2vUxLCgixmrhYFqSiYJoWrAjbKjac1ekLNigVaig4cNeq6EpX3Zbmc
	 4Tnyb+qlopO19IW+NP+m01kQzchSw8tkkLJoF/A1n6xepEUhHnGdwBAxmAdDqAjt4I
	 rwLU/LbYgeoWA==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] wifi: ath11k: change to set 11d state instead of start 11d scan while disconnect
In-Reply-To: <0526d034-2cb9-527e-b338-f73db0ed005b@quicinc.com> (Wen Gong's
	message of "Tue, 11 Oct 2022 11:58:58 +0800")
References: <20220928081413.27339-2-quic_wgong@quicinc.com>
	<166542536986.511.1244496445875563981.kvalo@kernel.org>
	<f50c94b9-252f-25ab-4650-bed52762bc4d@quicinc.com>
	<0526d034-2cb9-527e-b338-f73db0ed005b@quicinc.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Tue, 11 Oct 2022 07:31:10 +0300
Message-ID: <87czazoub5.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_213117_235170_49ED9511 
X-CRM114-Status: GOOD (  12.60  )
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

Wen Gong <quic_wgong@quicinc.com> writes:

> On 10/11/2022 11:53 AM, Wen Gong wrote:
>
>> On 10/11/2022 2:09 AM, Kalle Valo wrote:
>>> Wen Gong <quic_wgong@quicinc.com> wrote:
>>>
>>>> When switch to connect to a new AP for station which is already
>>>> connected
>>>> to an AP, the time cost is too long, it arrives 10 seconds.
>>>>
>>>> The reason is when switch connection, disconnect operation happened on
>>>> the 1st AP, then 11d scan start command sent to firmware, and then a
>>>> new hw scan arrived for the 2nd AP. The 11d scan is running at this
>>>> moment, so the hw scan can not start immediately, it needs to wait
>>>> the 11d scan finished, it increased the time cost of switch AP and
>>>> even happened scan fail as log below after apply the incoming patch.
>>>>
>>>> [ 1194.815104] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
>>>> [ 1196.864157] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
>>>> [ 1198.911926] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
>>>>
>>>> Change to set 11d state while disconnect, and the 11d scan will be
>>>> started after the new hw scan in ath11k_mac_op_hw_scan(). Then the
>>>> time cost of switching AP is small and not happened scan fail.
>>>>
>>>> Tested-on: WCN6855 hw2.0 PCI
>>>> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
>>>>
>>>> Fixes: 9dcf6808b253 ("ath11k: add 11d scan offload support")
>>>> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
>>>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>>> I still see warnings:
>>>
>>> [ 3627.691737] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
>>> [ 3715.435608] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
>>> [ 3860.333214] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
>>> [ 4542.000955] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
>>> [ 4604.018451] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
>> The failed log is now happened frequently as before, I will change
>> it again to suppress the failed log.
> change typo.
> The failed log is NOT happened frequently as before, I will change it
> again to suppress the failed log.

Please think about this more, ignoring errors doesn't sound like a good
solution.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
