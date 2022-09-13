Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AB6C54EE9
	for <ath11k@archiver.kernel.org>; Tue, 13 Sep 2022 07:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f36kJIqtY2xwx515XxfsYuH1tW+W0UEVBnQDk7oyhLo=; b=2aeJ5VH5Exw01C
	CDJ+WbSyPWUfFBbuHd2xUIXmFsDAuuS/C/abRMQLMDaIE5dnspm+LTPw/+IMz8iYOKvA7w9SRbwGO
	/sxYhLvS+8PabfTfUYPcv8NWxXKCqWbTcmw+FHkVKlY0GXQ6Nax71B3mepPgYo/3ZnSfgip4ejr3m
	mg6IplYUFg9jiU2JwhwL2UbxmDBH0G5upGa5D2fgoLXMW0BVqURWlDRKoTu2OOKsJPUlK+MA5d7+c
	aj3q/RrilCrzbdZmgQZVLSNDzVyiF9325kNqI5Vz4L+RUC4eC1B6XqZNR+tFh/Q0ThWq/ZNQE9qmv
	sXb5lLdrwpKhY3GLKpqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY07u-003QTM-Od; Tue, 13 Sep 2022 07:14:34 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY07k-003QPl-7q
	for ath11k@lists.infradead.org; Tue, 13 Sep 2022 07:14:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id AC110CE1079;
	Tue, 13 Sep 2022 07:14:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 531AAC433D7;
	Tue, 13 Sep 2022 07:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663053258;
	bh=3IAaG5i9BMfJkmrzHP9UDz6S0XKdAG3s8OWpc/wy6eY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=g/YkRIyA4ttkdZ3mOAFMSN5lOo5mfIgrGn0BA4eLFGYGzy5bgqNbdmImkku4mntg3
	 rZmOJlZgk75Yi8PUYz7WMAdW6UWLkp0zo3KtwBvQsqJiQbynnJAMGfr9hrTHt0SDNT
	 pYzuy75Le3/s9JNukeOxtXt2AqlSLJKbldoWkej6jWsnUNC3XTsdws2P1Ul4/Y6aVi
	 ChOosgNwdCkM3CKEfmil8J8OFsfR0DLVmXrPL3oH9IwYCW3YP2HNRQfcSBE0yxm/Pw
	 o1+W2qZVsJdOUYKeHKs8C1eTrVFNhk0Pm9PZRFKKJztVFDrxAzMCpO8oORvUDhtVsd
	 awdhvzafw+o1A==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] wifi: ath11k: Implement sram dump interface
References: <20220802075533.1744-1-quic_bqiang@quicinc.com>
	<20220802075533.1744-3-quic_bqiang@quicinc.com>
	<87fsh0962e.fsf@kernel.org>
	<0e64e270-77c3-5c1a-08bc-577a82c8abac@quicinc.com>
Date: Tue, 13 Sep 2022 10:14:14 +0300
In-Reply-To: <0e64e270-77c3-5c1a-08bc-577a82c8abac@quicinc.com> (Baochen
	Qiang's message of "Tue, 13 Sep 2022 11:06:33 +0800")
Message-ID: <87pmfz7nll.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_001430_988964_C4A76DF6 
X-CRM114-Status: GOOD (  17.60  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

>>> +	u32 i;
>>> +
>>> +	/* for offset beyond BAR + 4K - 32, may
>>> +	 * need to wakeup the device to access.
>>> +	 */
>>> +	wakeup_required = test_bit(ATH11K_FLAG_DEVICE_INIT_DONE, &ab->dev_flags) &&
>>> +			  end >= ATH11K_PCI_ACCESS_ALWAYS_OFF;
>>> +	if (wakeup_required && ab->pci.ops->wakeup) {
>>> +		ret = ab->pci.ops->wakeup(ab);
>>> +		if (ret)
>>> +			ath11k_warn(ab, "%s: failed to do wakeup: %d\n", __func__, ret);
>>> +	}
>>
>> I changed the error handling so that if wakeup() fails we do not
>> continue and just return an error.
>
> I prefer to keep the original design, because in that case we still
> have something to check after firmware crashes.
>
> I admit that the dump content may be invalid if wakeup fails, but we
> can know that by checking kernel log, so we can avoid misleading.

Too late now, I already applied the patch. You need to submit a new
patch to change the logic. And if we really want to ignore the wakeup
failure there should be a proper comment in the code explaining the idea,
and maybe improve the warning message to make it more understandable for
the user.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
