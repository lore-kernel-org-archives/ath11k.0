Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZebs-00021C-Dj
 for ath11k@lists.infradead.org; Mon, 02 Nov 2020 18:31:21 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: QCA6391: failed to get 32 MSI vectors, only 1 available
References: <ea0f787e-e4f2-2ca1-a1a4-84c9a35f4af6@doubly.so>
Date: Mon, 02 Nov 2020 20:30:52 +0200
In-Reply-To: <ea0f787e-e4f2-2ca1-a1a4-84c9a35f4af6@doubly.so> (Devin Bayer's
 message of "Mon, 2 Nov 2020 19:16:49 +0100")
Message-ID: <87a6vzvcf7.fsf@codeaurora.org>
MIME-Version: 1.0
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
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Devin Bayer <dev@doubly.so>
Cc: ath11k@lists.infradead.org

Devin Bayer <dev@doubly.so> writes:

> I am trying to get a QCA6391 card to work with the ath11k driver. It
> recognizes the card since it has the same device ID as the QCA6390.
> However it fails to initialize:
>
>> [    4.241127] ath11k_pci 0000:03:00.0: WARNING: ath11k PCI support is experimental!
>> [ 4.258806] ath11k_pci 0000:03:00.0: BAR 0: assigned [mem
>> 0xd0000000-0xd0ffffff 64bit]
>> [    4.258838] ath11k_pci 0000:03:00.0: enabling device (0000 -> 0002)
>> [ 4.258987] ath11k_pci 0000:03:00.0: failed to get 32 MSI vectors,
>> only 1 available
>> [    4.258990] ath11k_pci 0000:03:00.0: failed to enable msi: -22
>
> I've tried a few different kernel versions up to 5.10-rc2 and they all behave the same.
>
> Does anyone know if there is anything I can do to get this to work?

There's a similar thread ongoing:

http://lists.infradead.org/pipermail/ath11k/2020-October/000467.html

For me CONFIG_IRQ_REMAP helped, but it didn't help for Thomas. I suggest
to try that first anyway. I'll also include you to the other thread.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
