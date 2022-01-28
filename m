Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC94C433FE
	for <ath11k@archiver.kernel.org>; Fri, 28 Jan 2022 10:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sDd8aVK2icnBdsDZrFg655+ltVZ5yo/HyRh6J0KzNyg=; b=Zmr5DgMMV56+BF
	DGEMf+7R//kRgThbAHwrJfp9W2rvg9V0n9hIW13Rnn1ZnDEVHrOKyCoTzfckhqNQKoANU3aCjQwEx
	ks5LcM5rdkJtQ1Nc4VJGKnmS9/u+4DHnvf9mQv58Pp4PzyxRkrUpC2BPJ7jFJFTDYs+DEwAWblASH
	qXNSjqHxt3NI0H8aoSqoYiGuRMZw7lgq7cnM1RPF1ydEILAFl1Aiuox8Nem9HAs9gTCcKsjm2jQll
	fO3NGp3o3w98DGcdnC/BG1p/0SPWBEFcsB0uLRCVXp0d888HZX3s+pxg/CdvJ9UyxroeCA/ZZCm1Q
	7QSTTjo8/URK5b+pLZNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDOdv-001WnG-6R; Fri, 28 Jan 2022 10:38:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDOdc-001Wjj-Sj
 for ath11k@lists.infradead.org; Fri, 28 Jan 2022 10:37:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DD4BB61E6D;
 Fri, 28 Jan 2022 10:37:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21457C340E0;
 Fri, 28 Jan 2022 10:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643366271;
 bh=ysNEYwSdpCi6tFVlLx1/q5nHXNJqjoxSYhq3w+gi2so=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=etzYMrTucld4zPDlWJofz0p4FikaxGA2VAIKXeGLTq9Ir6bz488LmszQB7jUb3vWc
 V43tgZ/j/QLiRBY9JkJi7JDrEnmAPzgeUIsABFzU/EnxG+JmwuGsoDmZkJQH6nSkkB
 oGRWWk/t10Yw7cv5Y9lwUBCrEJJ1OlLAAvvMdzTf1PI29biiRhieulgM2cpvVpHqoh
 B/wx7248+5fjXUo1QKvqNTZ1U5BsnUORRu21MTuIG4LmMA0nBFY4kZBvmuxBAd+rtK
 8merRipkzLoMLIgXvNcAmxgo22yHhfm7cXSjag2H63qFLvm0mpoxgFwApPBRVU8Hyy
 zU5UWdhqK+6gQ==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>
Subject: Re: [PATCH v2 05/19] ath11k: Remove core PCI references from PCI
 common code
References: <1642337235-8618-1-git-send-email-quic_mpubbise@quicinc.com>
 <1642337235-8618-6-git-send-email-quic_mpubbise@quicinc.com>
 <87a6fggo0h.fsf@kernel.org>
Date: Fri, 28 Jan 2022 12:37:48 +0200
In-Reply-To: <87a6fggo0h.fsf@kernel.org> (Kalle Valo's message of "Fri, 28 Jan
 2022 12:20:30 +0200")
Message-ID: <871r0sgn7n.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_023753_033436_59EC6F64 
X-CRM114-Status: GOOD (  16.60  )
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

Kalle Valo <kvalo@kernel.org> writes:

> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:
>
>> Remove core PCI and ath11k PCI references(struct ath11k_pci)
>> from PCI common code. Since, PCI common code will be used
>> by hybrid bus devices, this code should be independent
>> from ATH11K PCI references and Linux core PCI references
>> like struct pci_dev.
>>
>> Since this change introduces function callbacks for bus wakeup
>> and bus release operations, wakeup_mhi HW param is no longer
>> needed and hence it is removed completely. Alternatively, bus
>> wakeup/release ops for QCA9074 are initialized to NULL as
>> QCA9704 does not need bus wakeup/release for register accesses.
>>
>> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
>
> [...]
>
>> @@ -651,6 +653,13 @@ struct ath11k_bus_params {
>>  	bool fixed_bdf_addr;
>>  	bool fixed_mem_region;
>>  	bool static_window_map;
>> +	struct {
>> +		void (*wakeup)(struct ath11k_base *ab);
>> +		void (*release)(struct ath11k_base *ab);
>> +		int (*get_msi_irq)(struct ath11k_base *ab, unsigned int vector);
>> +		void (*window_write32)(struct ath11k_base *ab, u32 offset, u32 value);
>> +		u32 (*window_read32)(struct ath11k_base *ab, u32 offset);
>> +	} ops;
>>  };
>
> Please don't use bus_params for this, I'm starting to suspect that we
> actually need to remove struct ath11k_bus_params altogether. It would be
> cleaner to have separate 'struct ath11k_pci_ops' or something like that.

And after looking at this more it seems .get_msi_irq is the only
function which actually has two different implementations. The other
four are either run or not run, there's no difference in the
implementation. So would it be cleaner to have a some sort check within
the function for these other four, instead using function pointers?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
