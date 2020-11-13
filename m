Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Message-ID: <cfee0b47ad026c74a105d3adf2923357bbc5e96e.camel@sipsolutions.net>
Subject: Re: [PATCH v2] mac80211: reject/clear user rate mask if not usable
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 13 Nov 2020 08:38:07 +0100
In-Reply-To: <4b8f37fde23262547edb6ed4635cf89b@codeaurora.org>
References: <20170308132022.4216-1-johannes@sipsolutions.net>
 <07179008e9369bc81e152009ca85191d@codeaurora.org>
 <5decc452-7b2a-db1d-c5eb-04ab6bb61553@broadcom.com>
 <4b8f37fde23262547edb6ed4635cf89b@codeaurora.org>
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
To: Wen Gong <wgong@codeaurora.org>, Arend Van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, ath10k@lists.infradead.org, kirtika@google.com

On Fri, 2020-11-13 at 10:08 +0800, Wen Gong wrote:
> 
> > Which was the intent of this change, wasn't it?

Indeed. Permitting this leads to warnings later.

> We need to set the tx rate to fixed at a single rate, e.g., 
> 54M/48M/36M... for a test case.
> I do not want a clear error message, I want to the 54M rate pass/set 
> success to lower wlan driver.
> Then lower wlan driver can handle it.

No, that will not happen. You should configure your test AP to actually
support 54M.

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
