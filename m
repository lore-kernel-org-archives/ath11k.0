Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdUES-0001lm-VN
 for ath11k@lists.infradead.org; Fri, 13 Nov 2020 08:14:59 +0000
MIME-Version: 1.0
Date: Fri, 13 Nov 2020 16:14:43 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v2] mac80211: reject/clear user rate mask if not usable
In-Reply-To: <cfee0b47ad026c74a105d3adf2923357bbc5e96e.camel@sipsolutions.net>
References: <20170308132022.4216-1-johannes@sipsolutions.net>
 <07179008e9369bc81e152009ca85191d@codeaurora.org>
 <5decc452-7b2a-db1d-c5eb-04ab6bb61553@broadcom.com>
 <4b8f37fde23262547edb6ed4635cf89b@codeaurora.org>
 <cfee0b47ad026c74a105d3adf2923357bbc5e96e.camel@sipsolutions.net>
Message-ID: <83dd20def685d303106f285400367b6e@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Arend Van Spriel <arend.vanspriel@broadcom.com>, kirtika@google.com, linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, ath11k@lists.infradead.org

On 2020-11-13 15:38, Johannes Berg wrote:
> On Fri, 2020-11-13 at 10:08 +0800, Wen Gong wrote:
>> 
>> > Which was the intent of this change, wasn't it?
> 
> Indeed. Permitting this leads to warnings later.
> 
>> We need to set the tx rate to fixed at a single rate, e.g.,
>> 54M/48M/36M... for a test case.
>> I do not want a clear error message, I want to the 54M rate pass/set
>> success to lower wlan driver.
>> Then lower wlan driver can handle it.
> 
> No, that will not happen. You should configure your test AP to actually
> support 54M.
Yes, the AP support 54M, but it is not basic rate, so 
ieee80211_set_bitrate_mask will reject 54M
because fail for check (mask->control[band].legacy & basic_rates).

suppor rates of my AP:
Tag: Supported Rates 6(B), 9, 12(B), 18, 24(B), 36, 48, 54, [Mbit/sec]
     Tag Number: Supported Rates (1)
     Tag length: 8
     Supported Rates: 6(B) (0x8c)
     Supported Rates: 9 (0x12)
     Supported Rates: 12(B) (0x98)
     Supported Rates: 18 (0x24)
     Supported Rates: 24(B) (0xb0)
     Supported Rates: 36 (0x48)
     Supported Rates: 48 (0x60)
     Supported Rates: 54 (0x6c)

> 
> johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
