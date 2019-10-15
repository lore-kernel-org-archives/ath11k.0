Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKPck-0003uW-BP
 for ath11k@lists.infradead.org; Tue, 15 Oct 2019 16:24:40 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 08/49] ath11k: add core.c
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
 <1566316095-27507-9-git-send-email-kvalo@codeaurora.org>
 <0c526ce00e6e1c7731c990515e7438230efb55af.camel@sipsolutions.net>
Date: Tue, 15 Oct 2019 19:24:29 +0300
In-Reply-To: <0c526ce00e6e1c7731c990515e7438230efb55af.camel@sipsolutions.net>
 (Johannes Berg's message of "Tue, 20 Aug 2019 22:32:45 +0200")
Message-ID: <87h84am0xu.fsf@codeaurora.org>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Johannes Berg <johannes@sipsolutions.net> writes:

>> +module_param_named(debug_mask, ath11k_debug_mask, uint, 0644);
>> +
>> +MODULE_PARM_DESC(debug_mask, "Debugging mask");
>> +
>> +static const struct ath11k_hw_params ath11k_hw_params = {
>> +			.name = "ipq8074",
>
> indentation here seems a bit too much

I'll fix that. I'll also group the module parameter macros above next to
each other.

>> +MODULE_LICENSE("Dual BSD/GPL");
>
> All your files state "ISC", shouldn't that be reflected here?

AFAIK MODULE_LICENSE() macro does not support ISC. AFAIK this is what
all ISC wireless drivers have.

Related to this, we now changed the license in ath11k to
BSD-3-Clause-Clear.

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
