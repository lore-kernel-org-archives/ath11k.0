Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5q4h-0002UH-L9
 for ath11k@lists.infradead.org; Thu, 05 Sep 2019 11:37:17 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 08/49] ath11k: add core.c
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
 <1566316095-27507-9-git-send-email-kvalo@codeaurora.org>
 <0c526ce00e6e1c7731c990515e7438230efb55af.camel@sipsolutions.net>
Date: Thu, 05 Sep 2019 14:37:09 +0300
In-Reply-To: <0c526ce00e6e1c7731c990515e7438230efb55af.camel@sipsolutions.net>
 (Johannes Berg's message of "Tue, 20 Aug 2019 22:32:45 +0200")
Message-ID: <874l1rnfdm.fsf@kamboji.qca.qualcomm.com>
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
>
>> +MODULE_LICENSE("Dual BSD/GPL");
>
> All your files state "ISC", shouldn't that be reflected here?

The MODULE_LICENSE() macro doesn't accept anything else. AFAIK all ISC
drivers use this.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
